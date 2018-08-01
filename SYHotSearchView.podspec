Pod::Spec.new do |s|
  s.name         = "SYHotSearchView"
  s.version      = "1.0.1"
  s.summary      = "SYHotSearchView used to show search words UI."
  s.homepage     = "https://github.com/potato512/SYHotSearchView"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "herman" => "zhangsy757@163.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/potato512/SYHotSearchView.git", :tag => "#{s.version}" }
  s.source_files  = "SYHotSearchView/*.{h,m}"
  s.frameworks = "UIKit", "Foundation"
  s.requires_arc = true
end
