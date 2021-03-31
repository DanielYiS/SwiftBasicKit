import UIKit
import HandyJSON
import GRDB.Swift

public class ZModelUserInfo: ZModelUserBase {
    
    /// 是否在线
    public var is_online: Bool = false
    /// 是否忙
    public var is_busy: Bool = false
    /// 是否热门
    public var is_hot: Bool = false
    /// 是否最新
    public var is_new: Bool = false
    /// 未读数量
    public var unReadCount: Int = 0
    /// 关注数量
    public var attcount: Int = 0
    /// 是否关注
    public var is_att: Bool = false
    /// 是否喜欢
    public var is_like: Bool = false
    /// 是否拉黑
    public var is_block: Bool = false
    /// 当前收入
    public var income: Int = 0
    /// 主播价格 - 每分钟消费多少金币
    public var price: Int = 0
    /// 消费金额
    public var consumption: Int = 0
    /// 主播标签
    public var tags: [ZModelTag]?
    /// 排行榜
    public var ranks: [ZModelUserBase]?
    /// 点赞数量
    public var comment_like_count: Int = 0
    /// 踩数量
    public var comment_nope_count: Int = 0
    /// 评级分数
    public var comment_rating: Double = 0
    /// 今日收益
    public var today_earnings: Int = 0
    /// 昨日收益
    public var yesterday_earnings: Int = 0
    /// 当前等级
    public var level: Int = 0
    /// 通话时长
    public var call_duration: Int = 0
    /// 首充方案 A 0.99 B 4.99
    public var test_first_recharge: String = "A"
    /// 是否有资格参加首次充值
    public var activity_first_recharge: Bool = false
    /// 免费通话资格
    public var activity_free_call: Bool = false
    /// 新用户领取礼包 1 可以领取
    public var activity_new_user_draw_token: Bool = false
    
    public required init() {
        super.init()
    }
    public required init<T: ZModelBase>(instance: T) {
        super.init(instance: instance)
        guard let model = instance as? ZModelUserInfo else {
            return
        }
        self.is_online = model.is_online
        self.is_busy = model.is_busy
        self.is_hot = model.is_hot
        self.is_new = model.is_new
        self.unReadCount = model.unReadCount
        self.attcount = model.attcount
        self.is_att = model.is_att
        self.is_like = model.is_like
        self.is_block = model.is_block
        self.income = model.income
        self.price = model.price
        self.consumption = model.consumption
        if let array = self.tags {
            var arraytag = [ZModelTag]()
            array.forEach { (tag) in
                arraytag.append(ZModelTag.init(instance: tag))
            }
            self.tags = arraytag
        }
        if let array = self.ranks {
            var arrayrank = [ZModelUserBase]()
            array.forEach { (tag) in
                arrayrank.append(ZModelUserBase.init(instance: tag))
            }
            self.ranks = arrayrank
        }
        self.comment_like_count = model.comment_like_count
        self.comment_nope_count = model.comment_nope_count
        self.comment_rating = model.comment_rating
        self.today_earnings = model.today_earnings
        self.yesterday_earnings = model.yesterday_earnings
        self.level = model.level
        self.call_duration = model.call_duration
        self.test_first_recharge = model.test_first_recharge
        self.activity_first_recharge = model.activity_first_recharge
        self.activity_free_call = model.activity_free_call
        self.activity_new_user_draw_token = model.activity_new_user_draw_token
    }
    public required init(row: Row) {
        super.init(row: row)
    }
    public override func encode(to container: inout PersistenceContainer) {
        super.encode(to: &container)
    }
    public override func mapping(mapper: HelpingMapper) {
        super.mapping(mapper: mapper)
        
        mapper <<< self.consumption <-- "token"
        mapper <<< self.comment_like_count <-- "comment.nice_count"
        mapper <<< self.comment_nope_count <-- "comment.nope_count"
        mapper <<< self.comment_rating <-- "comment.rating"
        mapper <<< self.test_first_recharge <-- "test.first_recharge"
        mapper <<< self.activity_first_recharge <-- "activity.first_recharge"
        mapper <<< self.activity_free_call <-- "activity.free_call"
        mapper <<< self.activity_new_user_draw_token <-- "activity.new_user_draw_token"
    }
}
