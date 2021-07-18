# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "localized_controllers/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name = "localized_controllers"
  spec.version = LocalizedControllers::VERSION
  spec.authors = ["hamuyuuki"]
  spec.email = ["13702378+hamuyuuki@users.noreply.github.com"]
  spec.homepage = "https://github.com/hamuyuuki/localized_controllers"
  spec.summary = "Bring automagic localization to controllers"
  spec.description =
    "Bring automagic localization to controllers. That's inspired by Localized Views in Rails."
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.5"

  spec.files = Dir["lib/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "actionpack", ">= 5.2"

  spec.add_development_dependency "appraisal"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "rubocop-rails"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "sqlite3"
end
