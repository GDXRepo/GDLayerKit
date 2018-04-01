Pod::Spec.new do |s|
  s.name             = "GDLayerKit"
  s.version          = "2.0.3"
  s.summary          = "Library designed for easy integrating MVVM support into your application without using complex reactive frameworks."
  s.homepage         = "https://github.com/GDXRepo/GDLayerKit"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "Georgiy Malyukov" => "elvorta.work@gmail.com" }
  s.source           = { :git => "https://github.com/GDXRepo/LayerKit.git", :tag => s.version.to_s }
  s.social_media_url = 'https://vk.com/deadlineru'

  s.platform     = :ios, '8.2'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'

  s.dependency 'Masonry'
end
