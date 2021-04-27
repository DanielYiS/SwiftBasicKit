#
# Be sure to run `pod lib lint SwiftBasicKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#
# 1. new code update github
# 2. local not code : pod repo add SwiftBasicKit  https://github.com/cdzhangshuangyu/SwiftBasicKit.git
#    local uodate code: cd ~/.cocoapods/repos/SwiftBasicKit. Then execute: pod repo update SwiftBasicKit
# 3. pod repo push SwiftBasicKit SwiftBasicKit.podspec --allow-warnings --sources='https://github.com/CocoaPods/Specs.git'
# 4. pod trunk push SwiftBasicKit.podspec --allow-warnings
# 5. pod install or pod update on you project execute

Pod::Spec.new do |s|
  s.name             = 'SwiftBasicKit'
  s.version          = '0.5.9'
  s.summary          = 'SwiftBasicKit'
  s.module_name      = 'SwiftBasicKit'

  s.homepage         = 'https://github.com/cdzhangshuangyu/SwiftBasicKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'cdzhangshuangyu' => 'cdzhangshuangyu@163.com' }
  s.source           = { :git => 'https://github.com/cdzhangshuangyu/SwiftBasicKit.git', :tag => s.version.to_s }
  
  s.platform              = :ios, '10.0'
  s.swift_versions        = "5"
  s.ios.deployment_target = '10.0'
  s.pod_target_xcconfig   = { 'SWIFT_VERSION' => '5.0' }
  
  s.frameworks    = 'UIKit'
  s.libraries     = 'z', 'sqlite3', 'c++'
  s.source_files  = 'SwiftBasicKit/**/*.{swift,h,m}'
  s.resources     = ['SwiftBasicKit/**/*.strings']
  s.ios.resource_bundle = { 'SwiftBasicKit' => 'SwiftBasicKit/Resource/Assets.xcassets' }
  
  s.dependency 'Moya'
  s.dependency 'PKHUD'
  s.dependency 'Result'
  s.dependency 'SnapKit'
  s.dependency 'SwiftDate'
  s.dependency 'Alamofire'
  s.dependency 'HandyJSON'
  s.dependency 'Kingfisher'
  s.dependency 'GRDB.swift'
  s.dependency 'Toast-Swift'
  s.dependency 'BFKit-Swift'
  s.dependency 'CryptoSwift'
  s.dependency 'SwiftyStoreKit'
  s.dependency 'SKPhotoBrowser'
  s.dependency 'ESPullToRefresh'
end
