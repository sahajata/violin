workspace 'Violin.xcworkspace'
project 'Violin/Violin'

platform :ios, '10.0'
inhibit_all_warnings!
use_frameworks!

target 'Example' do
  project 'Example/Example.xcodeproj'
  inherit! :search_paths

  pod 'Moya/RxSwift', '~> 11.0'
  pod 'SwiftyJSON', '~> 4.0'
  pod 'ObjectMapper', '~> 3.3'
  pod 'SwiftDate', '~> 5.0'
  pod 'Hue', '~> 3.0'
  pod 'MBProgressHUD', '~> 1.1'
  pod 'DZNEmptyDataSet', '~> 1.8'
  pod 'MJRefresh', '~> 3.1'
  pod 'Kingfisher', '~> 4.9'

  target 'ExampleTests' do
    inherit! :search_paths
  end
end
 
target 'Violin' do
  project 'Violin/Violin.xcodeproj'
  inherit! :search_paths

  pod 'Moya/RxSwift', '~> 11.0'
  pod 'SwiftyJSON', '~> 4.0'
  pod 'ObjectMapper', '~> 3.3'
  pod 'SwiftDate', '~> 5.0'
  pod 'Hue', '~> 3.0'
  pod 'MBProgressHUD', '~> 1.1'
  pod 'DZNEmptyDataSet', '~> 1.8'
  pod 'MJRefresh', '~> 3.1'
  pod 'Kingfisher', '~> 4.9'

  target 'ViolinTests' do
    inherit! :search_paths
  end
end

