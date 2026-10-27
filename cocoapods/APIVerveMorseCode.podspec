Pod::Spec.new do |s|
  s.name             = 'APIVerveMorseCode'
  s.version          = '1.2.3'
  s.summary          = 'Morse Code is a Morse code translator and decoder API: it converts plain text to Morse code dots and dashes and translates Morse back...'
  s.description      = <<-'DESC'
Morse Code is a Morse code translator and decoder API: it converts plain text to Morse code dots and dashes and translates Morse back into text. It provides character counts, dit and dah totals, and validation status, while paid plans add downloadable audio tones.

This iOS/macOS SDK provides a convenient way to access the Morse Code from APIVerve.
Supports both callback-based and async/await patterns.
                       DESC

  s.homepage         = 'https://apiverve.com/marketplace/morsecode?utm_source=cocoapods&utm_medium=referral&utm_content=homepage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'APIVerve' => 'hello@apiverve.com' }
  # The SDK repo holds every language; the pod lives under cocoapods/ with its own tag.
  s.source           = { :git => 'https://github.com/apiverve/morsecode-api.git', :tag => "cocoapods/v#{s.version}" }

  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '12.0'

  s.swift_version = '5.0'

  s.source_files = 'cocoapods/Sources/APIVerveMorseCode/**/*.swift'

  s.frameworks = 'Foundation'

  # APIResponse, APIVerveError and the request plumbing, shared by every APIVerve pod.
  s.dependency 'APIVerveCore', '~> 1.2'
end
