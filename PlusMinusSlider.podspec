#
# Be sure to run `pod lib lint PlusMinusSlider.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PlusMinusSlider'
  s.version          = '0.9.1.7'
  s.summary          = 'If you want to express plus and minus values with one slider, please use this PlusMinusSlider.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  
If you want to express plus and minus values with one slider, please use this PlusMinusSlider. It is written in SwiftUI.

                       DESC

  s.homepage         = 'https://github.com/xAxis47/PlusMinusSlider'
  s.screenshots     = 'https://github.com/xAxis47/PlusMinusSlider/assets/140302470/cccaeff2-41df-4d54-b995-d3e5c1306bb7'
  s.license          = { :type => 'Apache 2.0 License', :file => 'LICENSE' }
  s.author           = { 'xAxis47' => 'wataru.kawagoe.dev@gmail.com' }
  s.source           = { :git => 'https://github.com/xAxis47/PlusMinusSlider.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '16.0'
  s.swift_version = '4.0'

  s.source_files = 'PlusMinusSlider/Classes/**/*'
  
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.frameworks = 'SwiftUI'
  
  # s.resource_bundles = {
  #   'PlusMinusSlider' => ['PlusMinusSlider/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.dependency 'AFNetworking', '~> 2.3'
end
