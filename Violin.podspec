Pod::Spec.new do |s|

  s.name         = "Violin" # 项目名称
  s.version      = "1.0.1" # 版本号
  s.license      = "MIT" # 开源证书
  s.summary      = "IOS framework" # 简介

  s.homepage     = "https://github.com/sahajata/violin" # 主页
  s.source       = { :git => "https://github.com/sahajata/violin.git", :tag => "#{s.version}" } # 仓库地址
  s.source_files = "Violin/Violin/**/*.swift" # 代码位置
  s.requires_arc = true # 是否启用ARC
  s.platform     = :ios, "10.0" # 平台及支持的最低版本
  s.frameworks   = "UIKit", "Foundation" #支持的框架
  s.dependency "Alamofire", "~> 4.7"
  s.dependency "Moya", "~> 11.0.2"

  s.author             = { "BY" => "3328886@qq.com" } # 作者信息
  s.social_media_url   = "https://github.com/sahajata" # 个人主页

  s.swift_version = '4.1.2'
end
