#
# Be sure to run `pod lib lint Jargon.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name              = "Jargon"
  s.version           = "1.0.6"
  s.summary           = "Effortless Localization"
  s.description       = <<-DESC
                        The framework is designed to require minimal changes to your app's code, and yet cover nearly app of the app's text. Strings declared in code, using NSLocalizedString, as well as strings types into Interface Builder are both supported.
                        DESC
  s.homepage          = "http://www.usejargon.com"
  s.license           = { :type => "Commercial", :text => "              All text and design is copyright © 2014 Parlance, Inc.\n\n              All rights reserved.\n\n              http://www.usejargon.com\n" }
  s.author            = { "EmilienHuet" => "emilien@usejargon.com" }
  s.source            = { :git => "https://github.com/colatris/jargon-pod.git", :tag => s.version.to_s }
  s.social_media_url  = 'https://twitter.com/Jargon'
  s.documentation_url = 'https://dashboard.usejargon.com/#/jargon/docs/02_iOS/01_Quickstart'

  s.platform          = :ios, '6.0'
  s.requires_arc      = true
                      
  s.source_files      = '*.h'
  s.preserve_paths    = ['libJargon.a', 'jargon', 'jargon_xcode.rb']
  s.libraries         = ["Jargon"]
  s.frameworks        = 'UIKit'
                      
  s.xcconfig          = { "LIBRARY_SEARCH_PATHS" => "\"$(PODS_ROOT)/Jargon\"" }
  s.prepare_command   = 'ruby jargon_xcode.rb "$PWD"'
end
