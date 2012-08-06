# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rspec-xml/version"

Gem::Specification.new do |s|
  s.name        = "rspec-xml"
  s.version     = Rspec::Xml::VERSION
  s.authors     = ["Dan Carper"]
  s.email       = ["dcarper@dreamagile.com"]
  s.homepage    = ""
  s.summary     = %q{Spec your XML}
  s.description = %q{One simple matcher for now}

  s.rubyforge_project = "rspec-xml"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_runtime_dependency 'rspec'
  s.add_runtime_dependency 'nokogiri'
end
