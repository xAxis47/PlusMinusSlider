#
# Be sure to run `pod lib lint ZBSlider.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PMSlider'
  s.version          = '0.9.1.1'
  s.summary          = 'PMSlider can express minus value.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  
This slider is made by SwiftUI. PMSlider can express plus and minus value.

                       DESC

  s.homepage         = 'https://github.com/xAxis47/PMSlider'
  s.screenshots     = 'https://github.com/xAxis47/PlusMinusSlider/assets/140302470/cccaeff2-41df-4d54-b995-d3e5c1306bb7'
  s.license          = { :type => 'Apache 2.0 License', :file => 'LICENSE' }
  s.author           = { 'xAxis47' => 'wataru.kawagoe.dev@gmail.com' }
  s.source           = { :git => 'https://github.com/xAxis47/PMSlider.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '13.0'
  s.swift_version = '5.0'

  s.source_files = 'PMSlider/Classes/**/*'
  
  # s.resource_bundles = {
  #   'PMSlider' => ['PMSlider/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
