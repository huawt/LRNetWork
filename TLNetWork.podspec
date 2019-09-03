
Pod::Spec.new do |s|
  s.name             = 'TLNetWork'
  s.version          = '1.0.0'
  s.summary          = 'TLNetWork.'
  s.homepage         = 'https://github.com/huawtswork/TLNetWork'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'huawt' => 'ghost263sky@163.com' }
  s.source           = { :git => 'https://github.com/huawtswork/TLNetWork.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'TLNetWork/Classes/**/*'
  s.public_header_files = 'TLNetWork/Classes/**/*.h'
  s.frameworks = 'Foundation'
  s.dependency 'AFNetworking'
  s.dependency 'YTKNetwork'
end
