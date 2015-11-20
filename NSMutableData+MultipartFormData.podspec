Pod::Spec.new do |s|
  s.name         = "NSMutableData+MultipartFormData"
  s.version      = "0.2.0"
  s.summary      = "Easily build multipart/form-data formatted data. (which used to post an image.)"
  s.homepage     = "https://github.com/kaiinui/NSMutableData-MultipartFormDataAdditions"
  s.license      = "MIT"
  s.author       = { "kaiinui" => "lied.der.optik@gmail.com" }
  s.source       = { :git => "https://github.com/kaiinui/NSMutableData-MultipartFormDataAdditions.git", :tag => "v0.1.0" }
  s.source_files  = "KIMultipart/Classes/**/*.{h,m}"
  s.requires_arc = true
  s.ios.deployment_target = '7.0'
  s.watchos.deployment_target = '2.0'
end
