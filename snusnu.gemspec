Gem::Specification.new do |s|
  s.name        = "SnuSnu"
  s.version     = SnuSnu::VERSION
  s.platform    = Gem::Platform::RUBY
  s.author      = "Shaun Decker, Anthony Lombardi"
  s.email       = "sdecker@tmpg.com,alombardi@tmpg.com"
  s.homepage    = "tmpg.com"
  s.summary     = "TODO: Write a gem summary"
  s.description = "TODO: Write a gem description"

  s.files         = `git ls-files -z`.split("\x0")
  s.require_paths = ["lib"]

  s.license       = 'MIT'

end
