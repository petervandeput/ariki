module Ariki
	module StructuredData
	class Person < SchemaType
		attr_accessor :name
		validates :name, type: String, presence: true
		
		def _to_json_struct
			{
				'name' => self.name
			}
		end
	end
end

end