public enum SizeKind: Sendable {
    case allocated
    case logical
}
public struct ScanConfig: Sendable {

    public let root: String
    public let maxDepth: Int
    public let followSymlinks: Bool
    public let workerCount: Int
    public let includeFiles: Bool
    public let sizeKind: SizeKind
    public let stayOnDevice: Bool

    public init(
        root: String = "/",
        maxDepth: Int = .max,
        followSymlinks: Bool = false,
        workerCount: Int = 0,
        includeFiles: Bool = false,
        sizeKind: SizeKind = .allocated,
        stayOnDevice: Bool = false
    ) {
        self.root = root
        self.maxDepth = maxDepth
        self.followSymlinks = followSymlinks
        self.workerCount = workerCount
        self.includeFiles = includeFiles
        self.sizeKind = sizeKind
        self.stayOnDevice = stayOnDevice
    }
}
