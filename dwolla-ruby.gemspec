$:.unshift(File.join(File.dirname(__FILE__), 'lib'))
require "dwolla/version"

Gem::Specification.new do |s|
    s.name        = "dwolla-ruby"
    s.version     = Dwolla::VERSION
    s.authors     = ["Michael Schonfeld"]
    s.email       = ["michael@dwolla.com"]
    s.homepage    = "https://github.com/dwolla/dwolla-ruby"
    s.summary     = %q{Official Ruby Wrapper for Dwolla's API}
    s.description = %q{This SDK is for an old version of Dwolla's API and is no longer actively maintained. Please use dwolla_v2.}
    s.license     = 'MIT'

    s.rubyforge_project = "dwolla-ruby"

    s.files         = `git ls-files`.split("\n")
    s.test_files    = `git ls-files -- test/*`.split("\n")
    s.require_paths = %w{lib}

    s.add_dependency('rest-client')
    s.add_dependency('multi_json', '>= 1.0.4', '< 2')
    s.add_dependency('addressable', '>= 2')

    s.add_development_dependency('mocha')
    s.add_development_dependency('test-unit')
    s.add_development_dependency('rake')
end
