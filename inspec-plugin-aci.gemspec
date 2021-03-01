# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'inspec-plugin-aci/version'

Gem::Specification.new do |spec|
  spec.name          = 'inspec-plugin-aci'
  spec.version       = Aci::VERSION
  spec.authors       = ['Matyas Prokop']
  spec.email         = ['matyas@natilik.com']
  spec.summary       = 'InSpec Plugin ACI'
  spec.description   = 'Inspec Plugin to test ACI resources.'
  spec.homepage      = 'https://github.com/maty0609/inspec-aci'
  spec.license       = 'Apache-2.0'

  spec.files = %w{
    README.md inspec-plugin-aci.gemspec Gemfile
  } + Dir.glob(
    '{bin,docs,examples,lib,tasks,test}/**/*', File::FNM_DOTMATCH
  ).reject { |f| File.directory?(f) }

  spec.require_paths = ['lib']

  spec.add_dependency 'inspec', '>=2.3', '<4.0.0'
end
