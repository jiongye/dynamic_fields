$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "dynamic_fields/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "dynamic_fields"
  s.version     = DynamicFields::VERSION
  s.authors     = ["Jiongye Li"]
  s.email       = ["jiongye@gmail.com"]
  s.homepage    = "https://github.com/jiongye/dynamic_fields"
  s.summary     = "Generate dynamic fields for Rails"
  s.description = "Dynamically generate fields for Rails by using jQuery."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.2"
  s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
