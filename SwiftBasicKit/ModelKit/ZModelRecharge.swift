
import UIKit
import HandyJSON
import GRDB.Swift
import SwiftBasicKit

class ZModelRecharge: ZModelBase {
    
    /// ID, 1:apa, 2:gpa, 3:ppa
    var gid: ZRechargeType = .apa
    /// 内购ID
    var code: String = ""
    /// 金额 $
    var price: Double = 0
    /// 原本金额 $
    var original_price: Double = 0
    /// 实得数
    var token_amount: Int = 0
    /// 原本数
    var original_token_amount: Int = 0
    
    required init() {
        super.init()
    }
    required init<T: ZModelBase>(instance: T) {
        super.init(instance: instance)
        guard let model = instance as? Self else {
            return
        }
        self.gid = model.gid
        self.code = model.code
        self.price = model.price
        self.original_price = model.original_price
        self.token_amount = model.token_amount
        self.original_token_amount = model.original_token_amount
    }
    required init(row: Row) {
        super.init(row: row)
    }
    override func encode(to container: inout PersistenceContainer) {
        super.encode(to: &container)
    }
    override func mapping(mapper: HelpingMapper) {
        super.mapping(mapper: mapper)
        
        mapper <<< self.gid <-- "gid"
        mapper <<< self.code <-- "code"
        mapper <<< self.price <-- "price"
        mapper <<< self.original_price <-- "original_price"
        mapper <<< self.token_amount <-- "token_amount"
        mapper <<< self.original_token_amount <-- "original_token_amount"
    }
}
