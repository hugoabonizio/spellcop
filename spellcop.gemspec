# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spellcop/version'

Gem::Specification.new do |spec|
  spec.name          = 'spellcop'
  spec.version       = Spellcop::VERSION
  spec.authors       = ['Hugo Abonizio']
  spec.email         = ['hugo_abonizio@hotmail.com']

  spec.summary       = %q{Search for typos on your code.}
  spec.description   = %q{Search for typos on your code.}
  spec.homepage      = 'https://github.com/hugoabonizio/spellcop'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'ffi-hunspell', '~> 0.3'
  spec.add_dependency 'thor', '0.19.1'
  
  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
end
