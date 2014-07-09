# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'voice_text/version'

Gem::Specification.new do |spec|
  spec.name          = "voice_text"
  spec.version       = VoiceText::VERSION
  spec.authors       = ["Takuji Shimokawa"]
  spec.email         = ["takuji.shimokawa@gmail.com"]
  spec.description   = %q{A client library for Voice Text Web API (https://cloud.voicetext.jp/webapi)}
  spec.summary       = %q{A client library for Voice Text Web API (https://cloud.voicetext.jp/webapi)}
  spec.homepage      = "https://github.com/takuji/voice_text"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
