#
# Be sure to run `pod lib lint SwiftBasicKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#
# pod repo add SwiftBasicKit  https://github.com/cdzhangshuangyu/SwiftBasicKit.git
# pod repo push SwiftBasicKit SwiftBasicKit.podspec --sources='https://github.com/CocoaPods/Specs.git'
# pod trunk push SwiftBasicKit.podspec --allow-warnings

Pod::Spec.new do |s|
  s.name             = 'SwiftBasicKit'
  s.version          = '0.0.5'
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
  
  s.dependency 'Moya'       , '~> 13.0.1'
  s.dependency 'Result'     , '~> 4.1.0'
  s.dependency 'Alamofire'  , '~> 4.9.1'
  s.dependency 'HandyJSON'  , '~> 5.0.2'
  s.dependency 'BFKit-Swift', '~> 6.0.1'
  s.dependency 'CryptoSwift', '~> 1.3.8'
  s.dependency 'GRDB.swift' , '~> 4.14.0'
end
