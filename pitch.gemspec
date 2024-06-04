Gem::Specification.new do |gem|
  gem.name          = 'pitch'
  gem.version       = '0.1'
  gem.authors       = 'John Labovitz'
  gem.email         = 'johnl@johnlabovitz.com'
  gem.summary       = %q{Create and analyze musical pitches from MIDI names/numbers and scientific pitch notation (SPN)}
  gem.description   = %q{Create and analyze musical pitches from MIDI names/numbers and scientific pitch notation (SPN)..}
  gem.homepage      = 'https://github.com/jslabovitz/pitch.git'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'tty-command', '~> 0.10'

  gem.add_development_dependency 'bundler', '~> 2.5'
  gem.add_development_dependency 'minitest', '~> 5.23'
  gem.add_development_dependency 'minitest-power_assert', '~> 0.3'
  gem.add_development_dependency 'rake', '~> 13.2'

end