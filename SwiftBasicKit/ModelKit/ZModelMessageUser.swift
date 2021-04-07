import UIKit
import HandyJSON
import GRDB.Swift

public class ZModelMessageUser: ZModelBase {
    
    public class override var databaseTableName: String { "tb_message_user" }
    public enum Columns: String, ColumnExpression {
        case userid, email, role, nickname, birthday, gender, avatar, age, messageid, message, message_time, message_type, message_direction, login_userid
    }
    public var userid: String = ""
    public var email: String = ""
    public var nickname: String = ""
    public var birthday: String = ""
    public var role: zUserRole = .user
    public var gender: zUserGender = .none
    public var avatar: String = ""
    public var age: Int = 0
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
        self.userid = model.userid
        self.email = model.email
        self.nickname = model.nickname
        self.role = model.role
        self.gender = model.gender
        self.avatar = model.avatar
        self.age = model.age
        self.birthday = model.birthday
        self.messageid = model.messageid
        self.message = model.message
        self.message_time = model.message_time
        self.message_type = model.message_type
        self.message_direction = model.message_direction
        self.login_userid = model.login_userid
    }
    public required init(row: Row) {
        super.init(row: row)
        
        self.userid = row[Columns.userid] ?? ""
        self.email = row[Columns.email] ?? ""
        self.nickname = row[Columns.nickname] ?? ""
        self.role = row[Columns.role] ?? .user
        self.gender = row[Columns.gender] ?? .none
        self.avatar = row[Columns.avatar] ?? ""
        self.age = row[Columns.age] ?? 0
        self.birthday = row[Columns.birthday] ?? ""
        self.messageid = row[Columns.messageid] ?? ""
        self.message = row[Columns.message] ?? ""
        self.message_time = row[Columns.message_time] ?? 0
        self.message_type = row[Columns.message_type] ?? .text
        self.message_direction = row[Columns.message_direction] ?? .send
        self.login_userid = row[Columns.login_userid] ?? ""
    }
    public override func encode(to container: inout PersistenceContainer) {
        super.encode(to: &container)
        
        container[Columns.userid] = self.userid
        container[Columns.email] = self.email
        container[Columns.nickname] = self.nickname
        container[Columns.role] = self.role
        container[Columns.gender] = self.gender
        container[Columns.avatar] = self.avatar
        container[Columns.age] = self.age
        container[Columns.birthday] = self.birthday
        container[Columns.messageid] = self.messageid
        container[Columns.message] = self.message
        container[Columns.message_time] = self.message_time
        container[Columns.message_type] = self.message_type
        container[Columns.message_direction] = self.message_direction
        container[Columns.login_userid] = self.login_userid
    }
    public override func mapping(mapper: HelpingMapper) {
        super.mapping(mapper: mapper)
        
        mapper <<< self.userid <-- "id"
        mapper <<< self.age <-- "profile.age"
        mapper <<< self.nickname <-- "profile.nickname"
        mapper <<< self.avatar <-- "profile.head"
        mapper <<< self.gender <-- "profile.gender"
        mapper <<< self.birthday <-- "profile.birthday"
    }
}
