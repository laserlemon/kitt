Gem::Specification.new do |spec|
  spec.name    = "kitt"
  spec.version = "1.0.0"

  spec.author      = "Steve Richert"
  spec.email       = "steve.richert@gmail.com"
  spec.summary     = "A Slack command Ruby engine"
  spec.description = "KITT is an experimental Ruby engine for handling Slack commands."
  spec.homepage    = "https://github.com/laserlemon/kitt"
  spec.license     = "MIT"

  spec.files      = `git ls-files -z`.split("\x0")
  spec.test_files = spec.files.grep(/^spec/)

  spec.add_dependency "rails", "~> 4.2.4"
  spec.add_dependency "slack-notifier", "~> 1.4"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
end
