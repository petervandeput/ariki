lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ariki/version"

Gem::Specification.new do |spec|
  spec.name          = "ariki"
  spec.version       = Ariki::VERSION
  spec.authors       = ["petervandeput"]
  spec.email         = ["vandeputp@gmail.com"]

  spec.summary       = %q{Ariki is a gem providing all your SEO functonality}
  spec.description   = %q{Stop coding, just plugin this gem}
  spec.homepage      = "https://github.com/petervandeput/ariki.git"

  spec.metadata["allowed_push_host"] = "https://github.com/petervandeput/ariki.git"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/petervandeput/ariki.git"
  spec.metadata["changelog_uri"] = "https://github.com/petervandeput/ariki.git."
	
  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "validated_object", "~> 2.0.2"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.post_install_message = <<-DOC
    All done!
    Run rails g ariki:install to create the following files

    /config/json_ld.yml containing your defaults for structured data
    /config/meta.yml containing your default information for Meta data




    In your application layout e.g /views/application.html.erb add the following below the line with <%= yield :head %>
    <%= render 'layouts/meta_header' %> #this will render your meta tags automatically
    <%= @organization_json_ld %>
    <%= @website_info_json_ld %>
    <%= @blog_posting_json_ld %>

  DOC
end
