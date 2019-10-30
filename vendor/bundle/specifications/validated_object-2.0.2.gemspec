# -*- encoding: utf-8 -*-
# stub: validated_object 2.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "validated_object".freeze
  s.version = "2.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "https://rubygems.org" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Robb Shecter".freeze]
  s.bindir = "exe".freeze
  s.date = "2018-04-05"
  s.description = "A small wrapper around ActiveModel Validations.".freeze
  s.email = ["robb@weblaws.org".freeze]
  s.homepage = "https://github.com/dogweather/validated_object".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Self-validating plain Ruby objects.".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.10"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<activemodel>.freeze, [">= 3.2.21"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.10"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_dependency(%q<activemodel>.freeze, [">= 3.2.21"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.10"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<activemodel>.freeze, [">= 3.2.21"])
  end
end
