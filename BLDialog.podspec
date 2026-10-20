Pod::Spec.new do |s|

  s.name         = "BLDialog"
  s.version      = "1.5.1"
  s.platform     = :ios, "12.0"
  s.requires_arc = true
  s.frameworks   = 'UIKit'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.summary      = "功能最多样式最多的弹窗，支持自定义视图,链式编程调用"
  s.description  = <<-DESC
                   普通弹窗 选择弹窗 时间选择弹窗 地区选择弹窗等
                   DESC
  s.homepage     = "https://github.com/blmyself/BLDialog"
  s.author       = { "wmz" => "925457662@qq.com" }
  s.source       = { :git => "https://github.com/blmyself/BLDialog.git", :tag => s.version.to_s }
  s.source_files = "BLDialog/BLDialog/**/*.{h,m}"
  s.resource_bundles = { "BLDialogResources" => ["BLDialog/BLDialog/BLDialog.bundle/**/*"] }
end
