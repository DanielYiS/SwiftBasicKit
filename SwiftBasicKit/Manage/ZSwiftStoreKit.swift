
import UIKit
import SwiftyStoreKit

public struct ZSwiftStoreKit {
    
    public var productIds: [String] = [String]()
    public static var shared = ZSwiftStoreKit()
    
    public static func completeTransactions() {
        SwiftyStoreKit.completeTransactions(atomically: true, completion: { purchases in
            ZSwiftStoreKit.shared.productIds.removeAll()
            for purchase in purchases {
                ZSwiftStoreKit.shared.productIds.append(purchase.productId)
                switch purchase.transaction.transactionState {
                case .purchased, .restored:
                    if purchase.needsFinishTransaction {
                        SwiftyStoreKit.finishTransaction(purchase.transaction)
                    }
                case .failed, .purchasing, .deferred: break
                }
            }
        })
    }
    public static func purchaseProduct(productId: String, diamond: Double, completion: ((_ error: Error?) -> Void)?) {
        SwiftyStoreKit.purchaseProduct(productId, quantity: 1, atomically: true) { result in
            switch result {
            case .success(let purchase):
                if let model = ZSettingKit.shared.user  {
                    model.balance += diamond
                    if let dic = model.toDictionary() {
                        ZSettingKit.shared.updateUser(dic)
                    }
                    ZSQLiteKit.setModel(model: model)
                }
                completion?(nil)
            case .error(let error):
                completion?(error)
            }
        }
    }
}
