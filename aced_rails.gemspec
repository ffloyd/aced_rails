# -*- encoding: utf-8 -*-
require File.expand_path('../lib/aced_rails/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Roman Kolesnev"]
  gem.email         = ["rvkolesnev@gmail.com"]
  gem.description   = %q{ACE editor for Rails 3.2+ apps}
  gem.summary       = %q{Provide some helpers and generators for using Ajax.org Cloud9 Editor}
  gem.homepage      = "https://github.com/ffloyd/aced_rails"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "aced_rails"
  gem.require_paths = ["lib"]
  gem.version       = AcedRails::VERSION

  gem.add_dependency "rails", "~> 4"
end
