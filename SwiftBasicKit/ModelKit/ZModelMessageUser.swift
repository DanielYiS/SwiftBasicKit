import UIKit
import HandyJSON
import GRDB.Swift

public class ZModelMessageUser: ZModelBase {
    
    public class override var databaseTableName: String { "tb_message_user" }
    public enum Columns: String, ColumnExpression {
        case userid, role, nickname, gender, avatar, age, messageid, message, message_type, message_direction, login_userid
    }
    public var userid: String = ""
    public var nickname: String = ""
    public var role: zUserRole = .user
    public var gender: zUserGender = .none
    public var avatar: String = ""
    public var age: Int = 0
    public var messageid: String = ""
    public var message: String = ""
    public var message_type: zMessageType = .text
    public var message_direction: zMessageDirection = .send
    public var login_userid: String = ZSettingKit.shared.userId
    
    public required init() {
        super.init()
    }
    public required init<T: ZModelBase>(instance: T) {
        super.init(instance: instance)
        guard let model = instance as? ZModelMessageUser else {
            return
        }
        self.userid = model.userid
        self.nickname = model.nickname
        self.role = model.role
        self.gender = model.gender
        self.avatar = model.avatar
        self.age = model.age
        self.messageid = model.messageid
        self.message = model.message
        self.message_type = model.message_type
        self.message_direction = model.message_direction
        self.login_userid = model.login_userid
    }
    public required init(row: Row) {
        super.init(row: row)
        
        self.userid = row[Columns.userid] ?? ""
        self.nickname = row[Columns.nickname] ?? ""
        self.role = row[Columns.role] ?? .user
        self.gender = row[Columns.gender] ?? .none
        self.avatar = row[Columns.avatar] ?? ""
        self.age = row[Columns.age] ?? 0
        self.messageid = row[Columns.messageid] ?? ""
        self.message = row[Columns.message] ?? ""
        self.message_type = row[Columns.message_type] ?? .text
        self.message_direction = row[Columns.message_direction] ?? .send
        self.login_userid = row[Columns.login_userid] ?? ""
    }
    public override func encode(to container: inout PersistenceContainer) {
        super.encode(to: &container)
        
        container[Columns.userid] = self.userid
        container[Columns.nickname] = self.nickname
        container[Columns.role] = self.role
        container[Columns.gender] = self.gender
        container[Columns.avatar] = self.avatar
        container[Columns.age] = self.age
        container[Columns.messageid] = self.messageid
        container[Columns.message] = self.message
        container[Columns.message_type] = self.message_type
        container[Columns.message_direction] = self.message_direction
        container[Columns.login_userid] = self.login_userid
    }
    public override func mapping(mapper: HelpingMapper) {
        super.mapping(mapper: mapper)
        
    }
}
