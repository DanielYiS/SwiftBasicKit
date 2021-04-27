
import UIKit
import HandyJSON
import GRDB.Swift
import SwiftBasicKit

enum ZRechargeType: Int, HandyJSONEnum {
    case apa = 1
    case gpa = 2
    case ppa = 3
}
class ZModelPurchase: ZModelBase {
    
    /// ID, 1:apa, 2:gpa, 3:ppa
    var gid: ZRechargeType = .apa
    /// 名称
    var name: String = ""
    /// 选中
    var select: String = ""
    /// 默认
    var normal: String = ""
    /// 内购项
    var items: [ZModelRecharge]?
    
    required init() {
        super.init()
    }
    required init<T: ZModelBase>(instance: T) {
        super.init(instance: instance)
        guard let model = instance as? Self else {
            return
        }
        self.gid = model.gid
        self.name = model.name
        self.select = model.select
        self.normal = model.normal
        if let array = model.items {
            self.items = [ZModelRecharge]()
            array.forEach { (item) in
                self.items?.append(ZModelRecharge.init(instance: item))
            }
        }
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
        mapper <<< self.name <-- "name"
        mapper <<< self.select <-- "icon.selected"
        mapper <<< self.normal <-- "icon.normal"
        mapper <<< self.items <-- "items"
    }
}
