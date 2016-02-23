require File.expand_path("../lib/snusnu/version", __FILE__)
Gem::Specification.new do |s|
  s.name        = "SnuSnu"
  s.version     = Snusnu::VERSION
  s.platform    = Gem::Platform::RUBY
  s.author      = "Shaun Decker, Anthony Lombardi"
  s.email       = "sdecker@tmpg.com,alombardi@tmpg.com"
  s.homepage    = "http://tmpg.com"
  s.summary     = "Write a gem summary"
  s.description = "Write a gem description"

  s.files         = `git ls-files -z`.split("\x0")
  s.require_paths = ["lib"]

  s.license       = 'MIT'

end
