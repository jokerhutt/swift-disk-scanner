public struct ScanConfig: Sendable {
    
    /// Starting directory for the scan
    public let root: String
    
    /// Max recursion depth (0 = only root, 1 = root + children, …)
    public let maxDepth: Int

    /// Follow symbolic links. Dangerous if true.
    public let followSymlinks: Bool

    /// Number of worker threads (0 = auto choose)
    public let workerCount: Int

    public init(
        root: String = "/",
        maxDepth: Int = .max,
        followSymlinks: Bool = false,
        workerCount: Int = 0
    ) {
        self.root = root
        self.maxDepth = maxDepth
        self.followSymlinks = followSymlinks
        self.workerCount = workerCount
    }
}
