# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'commerzbank/csv4gnucash/version'

Gem::Specification.new do |spec|
  spec.name          = 'commerzbank-csv4gnucash'
  spec.version       = Commerzbank::Csv4gnucash::VERSION
  spec.authors       = ['Kilian Sprotte']
  spec.email         = ['kilian.sprotte@gmail.com']

  spec.summary       = 'Tweak commerzbank CSV exports for import into GnuCash.'
  spec.homepage      = 'https://github.com/kisp/commerzbank-csv4gnucash'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise 'RubyGems 2.0 or newer is required to protect against' \
          ' public gem pushes.'
  end

  spec.files         = `git ls-files -z` \
                       .split("\x0") \
                       .reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 11.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'cucumber', '~> 2.3'
  spec.add_development_dependency 'aruba', '~> 0.14'
  spec.add_development_dependency 'rubocop', '~> 0.49'
  spec.add_development_dependency 'coveralls', '~> 0.8'
end
