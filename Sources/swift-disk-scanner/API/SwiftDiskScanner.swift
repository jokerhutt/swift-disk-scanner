// The Swift Programming Language
// https://docs.swift.org/swift-book


public enum SwiftDiskScanner {
    public static func startScan(_ config: ScanConfig) throws -> FileNode {
        return ParallelScannerRunner(config: config).run()
    }
}
