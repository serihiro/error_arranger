# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'error_arranger/version'

Gem::Specification.new do |spec|
  spec.name          = 'error_arranger'
  spec.version       = ErrorArranger::VERSION
  spec.authors       = ['Kazuhiro Serizawa']
  spec.email         = ['nserihiro@gmail.com']

  spec.summary       = %q{You can arrange error object before rescue_from handles.}
  spec.description   = %q{You can arrange error object before rescue_from handles.}
  spec.homepage      = 'https://github.com/serihiro/error_arranger'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'

  spec.add_development_dependency 'activesupport', '4.2.6'
end
