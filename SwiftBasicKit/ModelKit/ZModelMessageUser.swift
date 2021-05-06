import UIKit
import HandyJSON
import GRDB.Swift

public class ZModelMessageUser: ZModelBase {
    
    public class override var databaseTableName: String { "tb_message_user" }
    public enum Columns: String, ColumnExpression {
        case userid, email, role, nickname, birthday, gender, avatar, age, messageid, message, message_time, message_type, message_direction, login_userid
    }
    public var message_user: ZModelUserBase?
    public var message_user_login: ZModelUserLogin?
    public var messageid: String = ""
    public var message: String = ""
    public var message_time: Double = 0.0
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
        if let user = model.message_user {
            self.message_user = ZModelUserBase.init(instance: user)
        }
        if let user = model.message_user_login {
            self.message_user_login = ZModelUserLogin.init(instance: user)
        }
        self.messageid = model.messageid
        self.message = model.message
        self.message_time = model.message_time
        self.message_type = model.message_type
        self.message_direction = model.message_direction
        self.login_userid = model.login_userid
    }
    public required init(row: Row) {
        super.init(row: row)
        self.message_user = ZModelUserBase.init(row: row)
        self.message_user_login = ZModelUserLogin.init(row: row)
        
        self.messageid = row[Columns.messageid] ?? ""
        self.message = row[Columns.message] ?? ""
        self.message_time = row[Columns.message_time] ?? 0
        self.message_type = row[Columns.message_type] ?? .text
        self.message_direction = row[Columns.message_direction] ?? .send
        self.login_userid = row[Columns.login_userid] ?? ""
    }
    public override func encode(to container: inout PersistenceContainer) {
        super.encode(to: &container)
        
        if let user = self.message_user {
            container[Columns.userid] = user.userid
            container[Columns.email] = user.email
            container[Columns.nickname] = user.nickname
            container[Columns.role] = user.role
            container[Columns.gender] = user.gender
            container[Columns.avatar] = user.avatar
            container[Columns.age] = user.age
            container[Columns.birthday] = user.birthday
        }
        if let user = self.message_user_login {
            container[Columns.userid] = user.userid
            container[Columns.email] = user.email
            container[Columns.nickname] = user.nickname
            container[Columns.role] = user.role
            container[Columns.gender] = user.gender
            container[Columns.avatar] = user.avatar
            container[Columns.age] = user.age
            container[Columns.birthday] = user.birthday
        }
        container[Columns.messageid] = self.messageid
        container[Columns.message] = self.message
        container[Columns.message_time] = self.message_time
        container[Columns.message_type] = self.message_type
        container[Columns.message_direction] = self.message_direction
        container[Columns.login_userid] = self.login_userid
    }
    public override func mapping(mapper: HelpingMapper) {
        super.mapping(mapper: mapper)
        
    }
}
