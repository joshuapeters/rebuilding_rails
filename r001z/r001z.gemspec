# frozen_string_literal: true

require_relative "lib/r001z/version"

Gem::Specification.new do |spec|
  spec.name = "r001z"
  spec.version = R001z::VERSION
  spec.authors = ["Josh Peters"]
  spec.email = ["jpeters@wistia.com"]

  spec.summary = "A dope thing"
  spec.description = "a description"
  spec.homepage = "https://google.com"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "N/A"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_runtime_dependency "rack", "~> 2.0.7"

  # webrick is not included in ruby versions >= 3.0, so we need to include it along with rack
  spec.add_runtime_dependency "webrick", "~> 1.4.2"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
