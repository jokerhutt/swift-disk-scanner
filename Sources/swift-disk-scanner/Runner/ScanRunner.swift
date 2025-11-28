import Foundation
import Darwin
import Atomics

public final class ParallelScannerRunner {
    private let scanner: ParallelScanner
    private let config: ScanConfig

    public init(config: ScanConfig) {
        self.config = config
        self.scanner = ParallelScanner(
            includeFiles: config.includeFiles,
            maxDepth: config.maxDepth,
            workerCountHint: config.workerCount,
            sizeKind: config.sizeKind,
            stayOnDevice: config.stayOnDevice
        )
    }

    public func run() -> FileNode {
        var st = stat()
        let rootPath = config.root

        if lstat(rootPath, &st) == 0 {
            scanner.rootDev = FSUtil.devU64(st.st_dev)
        }

        let root = FileNode(path: rootPath, type: .directory, parent: nil, depth: 0)

        scanner.dirTaskCount.store(1, ordering: .relaxed)
        scanner.taskQueue.enqueue(root)

        let group = DispatchGroup()
        let q = DispatchQueue.global(qos: .userInitiated)

        for _ in 0..<scanner.workerCountHint {
            group.enter()
            q.async { [scanner] in
                scanner.workerLoop()
                group.leave()
            }
        }

        group.wait()
        return root
    }
}
