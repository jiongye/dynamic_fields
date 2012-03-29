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

  s.files = Dir["{app,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_runtime_dependency "rails", ">= 3.1.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "capybara"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "jquery-rails"
  s.add_development_dependency "simple_form"
end
