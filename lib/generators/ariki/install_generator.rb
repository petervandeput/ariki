require 'rails/generators'

module Ariki
	
	class InstallGenerator < Rails::Generators::Base
		source_root File.expand_path("../templates", __FILE__)
		
		def generate_default
			copy_file "json_ld.yml", "config/json_ld.yml"
			copy_file "default_meta.rb", "config/initializers/default_meta.rb"
			
			copy_file "meta.yml", "config/meta.yml"
			copy_file "default_json_ld.rb", "config/initializers/default_json_ld.rb"
			
			copy_file "_meta_header.html.erb", "views/layouts/_meta_header.html.erb"
			
			copy_file "sitemaps_controller.rb", "controllers/sitemaps_controller.rb"
			copy_file "index.xml.builder", "views/sitemaps/index.xml.builder"
			
			#add route
			route("get '/sitemap.xml' => 'sitemaps#index', defaults: { format: 'xml' }")
		
		
		end
	end
end

 