module Ariki
	module StructuredData
	class ImageObject < SchemaType
		attr_accessor :url
		validates :url, type: String, presence: true
		
		def _to_json_struct
			{
				'url' => self.url
			}
		end
	end
end
end