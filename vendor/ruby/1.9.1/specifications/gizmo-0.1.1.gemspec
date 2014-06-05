# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "gizmo"
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Luke Cunningham", "Steven Holloway", "Sam Weller"]
  s.date = "2010-09-02"
  s.description = "gizmo is a simple page model testing framework used and sponsored by 'realestate.com.au'. The aim of the project is to DRY up your testing assertions by abstracting code that defines your page resulting in a consistent, easy to maintain test suit"
  s.email = "luke@icaruswings.com"
  s.executables = ["gizmo"]
  s.extra_rdoc_files = ["LICENSE", "README.markdown"]
  s.files = ["bin/gizmo", "LICENSE", "README.markdown"]
  s.homepage = "http://github.com/icaruswings/gizmo"
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.16"
  s.summary = "simple page model testing framework"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 1.3.0"])
      s.add_development_dependency(%q<cucumber>, [">= 0.7.2"])
      s.add_development_dependency(%q<webrat>, [">= 0.7.0"])
      s.add_development_dependency(%q<capybara>, [">= 0.3.5"])
      s.add_development_dependency(%q<metric_fu>, [">= 1.3.0"])
      s.add_runtime_dependency(%q<nokogiri>, [">= 1.4.1"])
      s.add_runtime_dependency(%q<activesupport>, ["~> 2.3.5"])
      s.add_runtime_dependency(%q<tilt>, [">= 1.0.1"])
    else
      s.add_dependency(%q<rspec>, [">= 1.3.0"])
      s.add_dependency(%q<cucumber>, [">= 0.7.2"])
      s.add_dependency(%q<webrat>, [">= 0.7.0"])
      s.add_dependency(%q<capybara>, [">= 0.3.5"])
      s.add_dependency(%q<metric_fu>, [">= 1.3.0"])
      s.add_dependency(%q<nokogiri>, [">= 1.4.1"])
      s.add_dependency(%q<activesupport>, ["~> 2.3.5"])
      s.add_dependency(%q<tilt>, [">= 1.0.1"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.3.0"])
    s.add_dependency(%q<cucumber>, [">= 0.7.2"])
    s.add_dependency(%q<webrat>, [">= 0.7.0"])
    s.add_dependency(%q<capybara>, [">= 0.3.5"])
    s.add_dependency(%q<metric_fu>, [">= 1.3.0"])
    s.add_dependency(%q<nokogiri>, [">= 1.4.1"])
    s.add_dependency(%q<activesupport>, ["~> 2.3.5"])
    s.add_dependency(%q<tilt>, [">= 1.0.1"])
  end
end
