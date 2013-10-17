$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "artk/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "artk"
  s.version     = Artk::VERSION
  s.authors     = ["Adam Wead"]
  s.email       = ["amsterdamos@gmail.com"]
  s.homepage    = "https://github.com/awead/artk"
  s.summary     = "Provides a Rails interface to Archivist's Toolkit"
  s.description = "Provides a Rails interface to Archivist's Toolkit"
  s.license     = "Apache-2"

  s.files = Dir["{app,config,db,lib}/**/*", "LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 4.0.0"
  
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "mysql2"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "debugger"
end
