Pod::Spec.new do |s|
  s.name             = 'LRNetWorkSDK'
  s.version          = '0.0.1'
  s.summary          = 'LRNetWorkSDK.'
  s.homepage         = 'https://github.com/huawt/LRNetWork'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'huawt' => 'ghost263sky@163.com' }
  s.source           = { :git => 'https://github.com/huawt/LRNetWork.git', :tag => s.version.to_s }
  s.ios.deployment_target = '12.0'
  s.source_files = 'LRNetWorkSDK/Classes/*.*'
  s.frameworks = 'Foundation'
  s.dependency 'AFNetworking'
  s.dependency 'YTKNetwork'
end
