#
# Be sure to run `pod lib lint GDHollowUI.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GDHollowUI'
  s.version          = '0.1.0'
  s.summary          = 'Hollow UI'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  镂空UI, 包含镂空按钮(GDHollowButton), 镂空标签(GDHollowLabel) [稿定科技(厦门)]
                       DESC

  s.homepage         = 'https://github.com/Quanhua-Guan/GDHollowUI'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '宇园' => 'xinmuheart@163.com' }
  s.source           = { :git => 'https://github.com/Quanhua-Guan/GDHollowUI.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'GDHollowUI/Classes/**/*'
  
  # s.resource_bundles = {
  #   'GDHollowUI' => ['GDHollowUI/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
