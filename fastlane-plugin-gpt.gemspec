lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/gpt/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-gpt'
  spec.version       = Fastlane::Gpt::VERSION
  spec.author        = 'Marek Zvara'
  spec.email         = 'marek724@gmail.com'

  spec.summary       = 'Use GPT API to generate content from Fastlane. Usable to generate release notes for TestFlight or AppStore'
  # spec.homepage      = "https://github.com/<GITHUB_USERNAME>/fastlane-plugin-gpt"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.6'

  # Don't add a dependency to fastlane or fastlane_re
  # since this would cause a circular dependency

  # spec.add_dependency 'your-dependency', '~> 1.0.0'

  spec.add_development_dependency('bundler')
  spec.add_development_dependency('fastlane', '>= 2.212.1')
  spec.add_development_dependency('pry')
  spec.add_development_dependency('rake')
  spec.add_development_dependency('rspec')
  spec.add_development_dependency('rspec_junit_formatter')
  spec.add_development_dependency('rubocop', '1.12.1')
  spec.add_development_dependency('rubocop-performance')
  spec.add_development_dependency('rubocop-require_tools')
  spec.add_development_dependency('simplecov')
end
