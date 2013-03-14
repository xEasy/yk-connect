# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-youku-connect/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["rice"]
  gem.email         = ["yijo1001@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "omniauth-youku-connect"
  gem.require_paths = ["lib"]
  gem.version       = Omniauth::Youku::Connect::VERSION

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'restclient'
  gem.add_dependency 'omniauth-oauth2', '~> 1.0'
end
