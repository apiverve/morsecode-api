# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "apiverve_morsecode"
  spec.version       = "1.2.3"
  spec.authors       = ["APIVerve"]
  spec.email         = ["hello@apiverve.com"]

  spec.summary       = "Morse Code API - Ruby Client"
  spec.description   = "Morse Code is a Morse code translator and decoder API: it converts plain text to Morse code dots and dashes and translates Morse back into text. It provides character counts, dit and dah totals, and validation status, while paid plans add downloadable audio tones."
  spec.homepage      = "https://apiverve.com/marketplace/morsecode?utm_source=ruby&utm_medium=referral&utm_content=homepage"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/apiverve/morsecode-API/tree/main/ruby"
  spec.metadata["changelog_uri"] = "https://apiverve.com/changelog"
  spec.metadata["documentation_uri"] = "https://docs.apiverve.com/ref/morsecode"

  spec.files = Dir.glob("{lib}/**/*") + %w[README.md LICENSE]
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", ">= 1.0", "< 3.0"
  spec.add_dependency "faraday-multipart", "~> 1.0"
  spec.add_dependency "json", "~> 2.0"
end
