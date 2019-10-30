module Ariki
	module StructuredData
	class Builder
		
		def initialize
	
		end
		
		def website_info(name, url, potential_action_target, query_input)
			site_info = WebSite.new(
				name: name,
				url: url,
				potential_action: SearchAction.new(
					target: potential_action_target,
					query_input: query_input
				)
			)
			return site_info
		end
		
		
		def organization(name, founder ,  full_address, email, url, logo_url, same_as_urls)
			organization = Organization.new(
				name: name,
				founder: Person.new(name: founder),
				founding_location: Place.new(address: full_address),
				email: email,
				url: url,
				logo: ImageObject.new(url:logo_url),
				same_as: same_as_urls
			)
			return organization
		end
		
		def blog_posting(head_line,alternative_head_line,image,award,editor,genre,keywords,word_count ,publisher,author,url,date_published,date_created,date_modified,description,article_body)
			blog_posting = BlogPosting.new(
				head_line:head_line,
				alternative_head_line: alternative_head_line,
				image: image ,
				award: award,
				editor: editor,
				genre: genre,
				keywords:keywords,
				word_count: word_count.to_s,
				publisher:   Organization.new(name:publisher, logo:ImageObject.new(url:image), url:url),
				author: Person.new(name: author),
				url: url,
				date_published: date_published,
				date_created: date_created,
				date_modified: date_modified,
				description: description,
				article_body:article_body
			
			)
			return blog_posting
		end
		
	end
end

end