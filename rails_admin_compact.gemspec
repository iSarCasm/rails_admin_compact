$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_admin_compact/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_admin_compact"
  s.version     = RailsAdminCompact::VERSION
  s.authors     = ["SarCasm"]
  s.email       = ["sarcasm008@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of RailsAdminCompact."
  s.description = "TODO: Description of RailsAdminCompact."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.4"

  s.add_development_dependency "sqlite3"
end
