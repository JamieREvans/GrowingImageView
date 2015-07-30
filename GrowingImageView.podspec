Pod::Spec.new do |s|
  s.name             = "GrowingImageView"
  s.version          = "1.0.0"
  s.summary          = "A UIImageView that grows with a UIScrollView's contentOffset."
  s.homepage         = "https://github.com/JamieREvans/GrowingImageView"
  s.license          = 'MIT'
  s.author           = { "JamieREvans" => "jamie.riley.evans@gmail.com" }
  s.source           = { :git => "https://github.com/JamieREvans/GrowingImageView.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
end
