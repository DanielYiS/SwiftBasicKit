import UIKit
import HandyJSON
import GRDB.Swift

public class ZModelUpdate: ZModelBase {
    
    public class override var databaseTableName: String { "tb_update" }
    public enum Columns: String, ColumnExpression {
        case version, update, type, path, title, content
    }
    public var version: String = ""
    public var title: String = ""
    public var content: String = ""
    public var path: String = ""
    public var update: Bool = false
    public var type: Int = 0
    
    public required init() {
        super.init()
    }
    public required init<T>(instance: T) where T : ZModelBase {
        super.init(instance: instance)
        guard let model = instance as? Self else {
            return
        }
        self.version = model.version
        self.title = model.title
        self.content = model.content
        self.path = model.path
        self.update = model.update
        self.type = model.type
    }
    public required init(row: Row) {
        super.init(row: row)
        
        self.version = row[Columns.version] ?? ""
        self.title = row[Columns.title] ?? ""
        self.content = row[Columns.content] ?? ""
        self.path = row[Columns.path] ?? ""
        self.update = row[Columns.update] ?? false
        self.type = row[Columns.type] ?? 0
    }
    public override func encode(to container: inout PersistenceContainer) {
        super.encode(to: &container)
        
        container[Columns.version] = self.version
        container[Columns.title] = self.title
        container[Columns.content] = self.content
        container[Columns.path] = self.path
        container[Columns.update] = self.update
        container[Columns.type] = self.type
    }
    public override func mapping(mapper: HelpingMapper) {
        super.mapping(mapper: mapper)
        
        mapper <<< self.type <-- "status"
        mapper <<< self.title <-- "tips"
        mapper <<< self.content <-- "change_log"
        mapper <<< self.path <-- "link"
        mapper <<< self.update <-- "is_force"
    }
}
