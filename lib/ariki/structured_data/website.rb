module Ariki
	module StructuredData
	class WebSite < SchemaType
		attr_accessor :name, :url, :potential_action
		validates :name, type: String, presence: true
		validates :url, type: String, presence: true
		validates :potential_action, type: SearchAction, allow_nil: true
		
		def _to_json_struct
			{
				'name' => self.name,
				'url' => self.url,
				'potentialAction' => self.potential_action&.to_json_struct
			}
		end
	end
end

end