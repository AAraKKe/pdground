
# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pdground/version'

Gem::Specification.new do |spec|
  spec.name          = 'pdground'
  spec.version       = Pdground::VERSION
  spec.authors       = ['J.P. Araque']
  spec.email         = ['erjuanpea@gmail.com']

  spec.summary       = 'Round numbers using the PDG rounding rules'
  spec.description   = 'Provides an easy way to round any value
                        with a given uncertainty following PDG rounding rules. Mainly consists of a
                        Pdground module witha round method which will round the central value and
                        uncertainty.'
  spec.homepage      = 'https://gitlab.com/jparaque/pdground'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0'
  spec.add_development_dependency 'simplecov', '~> 0'

  spec.required_ruby_version = '~> 2.4'
end
