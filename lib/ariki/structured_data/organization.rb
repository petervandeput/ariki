require_relative "person"
require_relative "image_object"
require_relative "place"
module Ariki
	module StructuredData
	class Organization < SchemaType
		attr_accessor :email,
									:founder,
									:founding_date,
									:founding_location,
									:logo,
									:name,
									:url,
									:same_as
		
		validates :email, type: String, allow_nil: true
		validates :founder, type: Person, allow_nil: true
		validates :founding_date, type: Date, allow_nil: true
		validates :founding_location, type: Place, allow_nil: true
		validates :logo, type: ImageObject, allow_nil: true
		validates :name, type: String
		validates :url, type: String, allow_nil: true
		validates :same_as, type: Array, allow_nil: true
		
		def _to_json_struct
			{
				"name" => name,
				"email" => email,
				"url" => url,
				"logo" => logo.to_json_struct,
				# "founder" =>  founder.to_json_struct ,
				# "foundingDate" => founding_date.to_s,
				# "foundingLocation" => founding_location.to_json_struct,
				"sameAs" => same_as
			}
		end
	end
end
end