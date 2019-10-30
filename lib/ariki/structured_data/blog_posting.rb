require_relative "organization"
require_relative "person"
require_relative "place"
module Ariki
 		module StructuredData
		class BlogPosting <  SchemaType
			attr_accessor :head_line,
										:alternative_head_line,
										:image,
										:award,
										:editor,
										:genre,
										:keywords,
										:word_count,
										:publisher,
										:author,
										:url,
										:date_published,
										:date_created,
										:date_modified,
										:description,
										:article_body
			
			validates :head_line, type: String
			validates :alternative_head_line, type: String
			validates :image, type: String
			validates :award, type: String
			validates :editor, type: String
			validates :genre, type: String
			validates :keywords, type: String
			validates :word_count, type: String
			validates :publisher, type: Organization
			validates :author, type: Person
			validates :url, type: String
			validates :date_published, type: String
			validates :date_created, type: String
			validates :date_modified, type: String
			validates :description, type: String
			validates :article_body, type: String
			
			def _to_json_struct
				{
					"headline" => head_line,
					"mainEntityOfPage" => url,
					"alternativeHeadline" => alternative_head_line,
					"image" => image,
					"award" => award,
					"editor" => editor,
					"genre" => genre,
					"keywords" => keywords,
					"wordcount" => word_count,
					"publisher" => publisher.to_json_struct,
					"author" => author.to_json_struct,
					"url" => url,
					"datePublished" => date_published.to_s,
					"dateCreated" => date_created.to_s,
					"dateModified" => date_modified.to_s,
					"description" => description,
					"articleBody" => article_body
				}
			end
		end
	end
 
end