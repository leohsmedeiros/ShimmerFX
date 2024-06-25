Pod::Spec.new do |s|
  s.name         = 'ShimmerFX'
  s.version      = '1.0.0'
  s.summary      = 'A library to add shimmering effects to SwiftUI views.'
  s.description  = <<-DESC
  ShimmerEffect is a library that allows you to add shimmering effects to your SwiftUI views with ease.
  DESC
  s.homepage     = 'https://github.com/leohsmedeiros/ShimmerFX'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Leonardo Medeiros' => 'leohsmedeiros@gmail.com' }
  s.source       = { :git => 'https://github.com/leohsmedeiros/ShimmerFX.git', :tag => 'v1.0.0' }
  s.ios.deployment_target = '15.0'
  s.source_files  = 'Sources/ShimmerFX/**/*.{swift,h,m}'
  s.swift_version = '5.0'
end
