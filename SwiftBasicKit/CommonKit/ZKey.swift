
import UIKit

/// 全局配置主键
public struct ZKey {
    
    private static var shared = ZKey.init()
    
    private var productIds: [String] = [String]()
    
    private var api = ""
    private var web = ""
    private var wss = ""
    
    private var appleId = ""
    private var serviceAppId = ""
    private var messageAppId = ""
    private var pushAppId = ""
    private var bugAppId = ""
    private var countAppId = ""
}
extension ZKey {
    public struct Common {
        /// CellId
        public static let kCellId = "kCellId"
        /// CellHeader
        public static let kCellHeaderId = "kCellHeaderId"
        /// CellFooter
        public static let kCellFooterId = "kCellFooterId"
        
    }
}
extension ZKey {
    public static let number = Number.init()
    public struct Number {
        /// 键盘最小高度
        public let keyboardHeight: CGFloat = 180
        /// 动画时间 0.25
        public let animateTime: TimeInterval = 0.25
        /// 提示框等待时长
        public let toastWaitTime: TimeInterval = 5
        /// 消息重连间隔 10
        public let messageReconnectTime: TimeInterval = 10
        /// 广告切换间隔
        public let bannerSwitchTime: TimeInterval = 5.0
        /// PNG->JPEG压缩值
        public let pngToJpegCompress: CGFloat = 0.6
        
        /// 分页默认数量 10
        public let pageCount: Int = 10
        /// 显示最大数量 999
        public let maxCount: Int = 999
        
        /// 超过多少秒评价
        public let evaluationTime: Int = 60
        
        /// 昵称最小数量 3
        public let nickNameMinCount: Int = 3
        /// 昵称最大数量 20
        public let nickNameMaxCount: Int = 20
        
        /// 邮箱长度最小值 6
        public let emailMinCount: Int = 6
        /// 邮箱长度最大值 50
        public let emailMaxCount: Int = 50
        
        /// 密码长度最小值 6
        public let passwordMinCount: Int = 6
        /// 密码长度最大值 20
        public let passwordMaxCount: Int = 20
        
        /// 关于我最大数量 140
        public let aboutMeMaxCount: Int = 140
        /// 消息内容长度限制 140
        public let messageMaxCount: Int = 140
        /// 举报内容长度限制 10
        public let reportMinCount: Int = 10
        /// 举报内容长度限制 140
        public let reportMaxCount: Int = 140
        /// 意见反馈长度限制 10
        public let feedBackMinCount: Int = 10
        /// 意见反馈长度限制 140
        public let feedBackMaxCount: Int = 140
        
        /// 年龄长度最大值 3
        public let ageMaxCount: Int = 3
        /// 最大年龄 80
        static let ageMax: Int = 80
        /// 最小年龄 18
        static let ageMin: Int = 18
        /// 默认年龄 25
        static let ageDefault: Int = 25
        
        /// 最大照片数量 9
        static let photoMaxCount: Int = 9
        
        /// Tag最大选中数量 10
        static let tagMaxCount: Int = 10
        
        /// 最小距离 5
        static let distanceMin: Int = 5
        /// 最小距离 200
        static let distanceMax: Int = 200
    }
}
extension ZKey {
    public static let timeFormat = TimeFormat.init()
    public struct TimeFormat {
        /// MM/dd/yyyy HH:mm
        public let yyyyMMddHHmm: String = "MM/dd/yyyy HH:mm"
        /// MM/dd/yyyy
        public let yyyyMMdd: String = "MM/dd/yyyy"
        /// MM/dd
        public let MMdd: String = "MM/dd"
        /// HH:mm:ss
        public let HHmmss: String = "HH:mm:ss"
        /// HH:mm
        public let HHmm: String = "HH:mm"
    }
}
extension ZKey {
    public static let appId = AppId.init()
    public struct AppId {
        public var appleId      = ZKey.shared.appleId
        public var serviceAppId = ZKey.shared.serviceAppId
        public var messageAppId = ZKey.shared.messageAppId
        public var pushAppId    = ZKey.shared.pushAppId
        public var bugAppId     = ZKey.shared.bugAppId
        public var countAppId   = ZKey.shared.countAppId
    }
    /// 配置AppId
    /// appleId 苹果应用ID
    /// serviceAppId 服务器
    /// messageAppId 聊天消息
    /// pushAppId 推送平台
    /// bugAppId Bug收集平台
    /// countAppId 统计平台
    public func configService(appleId: String, serviceAppId: String, messageAppId: String, pushAppId: String, bugAppId: String, countAppId: String) {
        ZKey.shared.appleId = appleId
        ZKey.shared.serviceAppId = serviceAppId
        ZKey.shared.messageAppId = messageAppId
        ZKey.shared.pushAppId = pushAppId
        ZKey.shared.bugAppId = bugAppId
        ZKey.shared.countAppId = countAppId
    }
}
extension ZKey {
    public static let service = Service.init()
    public struct Service {
        public var api = ZKey.shared.api
        public var web = ZKey.shared.web
        public var wss = ZKey.shared.wss
    }
    public func configService(api: String, web: String, wss: String) {
        ZKey.shared.api = api
        ZKey.shared.web = web
        ZKey.shared.wss = wss
    }
}
extension ZKey {
    public static let webLink = WebLink.init()
    public struct WebLink {
        /// 关于我们
        public let aboutMe = ZKey.shared.web + "aboutme.hmtl"
        /// 团队服务
        public let teamService = ZKey.shared.web + "teamservice.hmtl"
        /// 免责申明
        public let disclaimer = ZKey.shared.web + "disclaimer.html"
        /// 使用协议
        public let useAgreement = ZKey.shared.web + "useagree.html"
        /// 支付协议
        public let payAgreement = ZKey.shared.web + "payagree.html"
    }
}
extension ZKey {
    public static let applePay = ApplePay.init()
    public struct ApplePay {
        public var productId_0: String {
            return ZKey.shared.productIds.count > 0 ? ZKey.shared.productIds[0] : ""
        }
        public var productId_1: String {
            return ZKey.shared.productIds.count > 1 ? ZKey.shared.productIds[1] : ""
        }
        public var productId_2: String {
            return ZKey.shared.productIds.count > 2 ? ZKey.shared.productIds[2] : ""
        }
        public var productId_3: String {
            return ZKey.shared.productIds.count > 3 ? ZKey.shared.productIds[3] : ""
        }
        public var productId_4: String {
            return ZKey.shared.productIds.count > 4 ? ZKey.shared.productIds[4] : ""
        }
        public var productId_5: String {
            return ZKey.shared.productIds.count > 5 ? ZKey.shared.productIds[5] : ""
        }
        public var productId_6: String {
            return ZKey.shared.productIds.count > 6 ? ZKey.shared.productIds[6] : ""
        }
        public var productId_7: String {
            return ZKey.shared.productIds.count > 7 ? ZKey.shared.productIds[7] : ""
        }
        public var productId_8: String {
            return ZKey.shared.productIds.count > 8 ? ZKey.shared.productIds[8] : ""
        }
    }
    public func configProductIds(ids: [String]) {
        ZKey.shared.productIds.removeAll()
        ZKey.shared.productIds.append(contentsOf: ids)
    }
}
extension ZKey {
    /// 手机系统名称
    public static let SystemName: String = UIDevice.current.systemName
    /// 手机系统版本
    public static let SystemVersion: Float = UIDevice.current.systemVersion.floatValue
    /// 应用版本号
    public static let AppVersion: String = (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String) ?? ""
    /// 应用名称
    public static let AppName: String = (Bundle.main.infoDictionary?["CFBundleName"] as? String) ?? ""
    /// BundleIdentifier
    public static let BundleIdentifier: String = (Bundle.main.infoDictionary?["CFBundleIdentifier"] as? String) ?? ""
    /// 设备名称
    public static let DeviceName: String = UIDevice.current.modelName
    
    /// 应用地址
    public static let AppUrl: String = "itms-apps://itunes.apple.com/cn/app/id\(ZKey.appId.appleId)"
    /// 评分地址
    public static let AppRateUrl: String = "itms-apps://itunes.apple.com/app/id\(ZKey.appId.appleId)?action=write-review"
    
    /// 拨打电话
    public static let TelPhone: String = "telprompt://"
}
