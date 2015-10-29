$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "kitt/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "kitt"
  s.version     = KITT::VERSION
  s.authors     = ["Steve Richert"]
  s.email       = ["steve.richert@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of KITT."
  s.description = "TODO: Description of KITT."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.4"

  s.add_development_dependency "sqlite3"
end
