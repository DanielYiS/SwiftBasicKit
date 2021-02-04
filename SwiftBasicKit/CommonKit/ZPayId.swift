
import UIKit

/// 全局支付ProductId
public struct ZPayId {
    
    public static var shared = ZPayId()
    
    var ProductIds: [String] = [String]()
    
    public var ProductId_0: String {
        return ZPayId.shared.ProductIds.count > 0 ? ZPayId.shared.ProductIds[0] : ""
    }
    public var ProductId_1: String {
        return ZPayId.shared.ProductIds.count > 1 ? ZPayId.shared.ProductIds[1] : ""
    }
    public var ProductId_2: String {
        return ZPayId.shared.ProductIds.count > 2 ? ZPayId.shared.ProductIds[2] : ""
    }
    public var ProductId_3: String {
        return ZPayId.shared.ProductIds.count > 3 ? ZPayId.shared.ProductIds[3] : ""
    }
    public var ProductId_4: String {
        return ZPayId.shared.ProductIds.count > 4 ? ZPayId.shared.ProductIds[4] : ""
    }
    public var ProductId_5: String {
        return ZPayId.shared.ProductIds.count > 5 ? ZPayId.shared.ProductIds[5] : ""
    }
    public var ProductId_6: String {
        return ZPayId.shared.ProductIds.count > 6 ? ZPayId.shared.ProductIds[6] : ""
    }
    public var ProductId_7: String {
        return ZPayId.shared.ProductIds.count > 7 ? ZPayId.shared.ProductIds[7] : ""
    }
    public var ProductId_8: String {
        return ZPayId.shared.ProductIds.count > 8 ? ZPayId.shared.ProductIds[8] : ""
    }
    public func configProductIds(ids: [String]) {
        ZPayId.shared.ProductIds.removeAll()
        ZPayId.shared.ProductIds.append(contentsOf: ids)
    }
}
