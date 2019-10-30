module Ariki
	module StructuredData
	class SearchAction < SchemaType
		attr_accessor :target, :query_input
		validates :target, type: String, presence: true
		validates :query_input, type: String, presence: true
		
		def _to_json_struct
			{
				'target' => self.target,
				'query-input' => self.query_input
			}
		end
	end
end
end