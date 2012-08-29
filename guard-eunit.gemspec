# -*- encoding: utf-8 -*-
require File.expand_path('../lib/guard/eunit/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Misha Gorodnitzky"]
  gem.email         = ["misha@digital-science.com"]
  gem.description   = 'Guard module to automatically run Erlang EUnit tests using rebar.'
  gem.summary       = 'Guard module for EUnit tests.'
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "guard-eunit"
  gem.require_paths = ["lib"]
  gem.version       = Guard::EUnitVersion::VERSION
end
