# Ariki

The Ariki gem will provide you with the following:
- sitemap controller (with added route) to generate your sitemap.xml
- meta tags management for your view using defaults with option to override in your specific actions
- structured data management JSON+LD scripts automatically injected in your web pages

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ariki'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ariki

## Usage
After installation you run 
```
rails g ariki:install
``` 
This will copy the following files containing global defaults: 
- /config/json_ld.yml containing your defaults for structured data
- /config/meta.yml containing your default information for Meta data

In your application layout e.g /views/application.html.erb add the following below the line with ```<%= yield :head %>```
```
    <%= render 'layouts/meta_header' %> #this will render your meta tags automatically
    <%= @organization_json_ld %>
    <%= @website_info_json_ld %>
    <%= @blog_posting_json_ld %>
```
### Structured Data a.k.a. Json+ld
Since we want to inject always the website and company information go to your application_controller and add the following
``` 
require "ariki"
class ApplicationController < ActionController::Base
	before_action :generate_json_ld
	
		private
    	def generate_json_ld
    		builder = Ariki::StructuredData::Builder::new #create a builder instance
    		@website_info_json_ld = builder.website_info(DEFAULT_JSON_LD["website_name"],
    																								 DEFAULT_JSON_LD["website_url"], "search_by_name", "q=name")
    		@organization_json_ld = builder.organization(DEFAULT_JSON_LD["organization_name"],
    																								 DEFAULT_JSON_LD["organization_founder"],
    																								 DEFAULT_JSON_LD["organization_address"],
    																								 DEFAULT_JSON_LD["organization_email"],
    																								 DEFAULT_JSON_LD["organization_url"],
    																								 DEFAULT_JSON_LD["organization_logo_url"],
    																								 DEFAULT_JSON_LD["organization_same_as_urls"])
    	end
	end
```
If your website has a blog you also want to render structured data for your blog posting.
In the controller with the show action add the following
``` 
    #set specific meta data for this blog post which will override your default automatically for this instance
    @page_title = @post.title
    @meta_title = @post.title
    @meta_description = @post.meta_description
    @keywords = @post.meta_keywords
    
    #generate structured data
    builder = Ariki::StructuredData::Builder::new #create a builder instance
    @blog_posting_json_ld = builder.blog_posting(@post.title,
                                                          @post.title,
                                                          @post.featured_image.attached? ?  root_url + rails_blob_path(@post.featured_image).to_s: DEFAULT_JSON_LD["organization_logo_url"],

                                                          "",
                                                          DEFAULT_JSON_LD["blog_editor"],
                                                          DEFAULT_JSON_LD["blog_genre"],
                                                          @post.meta_keywords,
                                                          @post.word_count,
                                                          DEFAULT_JSON_LD["blog_publisher"],
                                                          DEFAULT_JSON_LD["blog_author"],
                                                          root_url + @post.slug,
                                                          @post.publish_date.to_s,
                                                          @post.publish_date.to_s,
                                                          @post.updated_at.to_s,
                                                          @post.meta_description,
                                                          @post.body.html_safe)

```
_Your blog model might be different so make the applicable changes_

### Sitemap
This gem installed a sitemaps_controller and a /views/sitemap.xml.builder file you can use as a starting point
The route is automatically added to your routes.rb so you can test it by calling http://localhost:3000/sitemap.xml
Add the pages you want in your sitemap