# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'easytobookr/version'

Gem::Specification.new do |gem|
  gem.name          = "easytobookr"
  gem.version       = Easytobookr::VERSION
  gem.authors       = ["Paul Gallagher"]
  gem.email         = ["gallagher.paul@gmail.com"]
  gem.description   = %q{Easytobook.com API wrapper for Ruby}
  gem.summary       = %q{Provides a simple interface to the easytobook.com API for hotel listings and booking}
  gem.homepage      = "https://github.com/evendis/easytobookr"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency(%q<nokogiri>, [">= 1.4.4"])

  gem.add_development_dependency(%q<bundler>, ["> 1.1.0"])
  gem.add_development_dependency(%q<rake>, ["~> 0.9.2.2"])
  gem.add_development_dependency(%q<rspec>, ["~> 2.11.0"])
  gem.add_development_dependency(%q<rdoc>, ["~> 3.11"])
  gem.add_development_dependency(%q<guard-rspec>, ["~> 2.1.1"])
  gem.add_development_dependency(%q<rb-fsevent>, ["~> 0.9.2"])

end
