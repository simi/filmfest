# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-contest'
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Contest engine for Refinery CMS'
  s.date              = '2012-02-27'
  s.summary           = 'Contest engine for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]

  # Runtime dependencies
  s.add_dependency             'refinerycms-core'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing'
end
