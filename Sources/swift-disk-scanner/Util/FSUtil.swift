import Darwin
public enum FSUtil {
    static func devU64(_ d: dev_t) -> UInt64 {
        UInt64(bitPattern: Int64(d))
    }
}
