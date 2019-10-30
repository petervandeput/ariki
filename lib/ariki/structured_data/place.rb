module Ariki
	module StructuredData
	class Place < SchemaType
		attr_accessor :address
		validates :address, type: String, presence: true
		
		def _to_json_struct
			{
				'address' => self.address
			}
		end
	
	end
end

end