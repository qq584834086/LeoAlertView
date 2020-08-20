Pod::Spec.new do |s|
  s.name         = "LEOAlertView"
  s.version      = "1.0.0"
  s.license      = "MIT"
  s.summary      = "一款自定义AlertView，支持默认Alert和actionSheet样式，也可支持自定义的显示/隐藏动画"
  s.homepage     = "https://github.com/qq584834086/LeoAlertView"
  s.author       = { "JeffWang" => "584834086@qq.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/qq584834086/LeoAlertView.git", :tag => s.version }
  s.source_files  = "LEOAlert", "Sources/LEOAlert/*.swift"
end
