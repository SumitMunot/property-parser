class Fetcher < ActiveRecord::Base

	# returns the property data hash
	# input => property JSON
	# output => Hash
	def parse(property)
		json_content = JSON.parse(property)
    property_data = json_content["properties"]
    room_data = Hash.new

    property_data.each do |property|
      property_hash = build_formatted_property_hash(property)
      room_data = {room: property_hash}
    end

    room_data
	end

	# builds the property hash with correct set of keys as per structure provided
	# output => Hash
	def build_formatted_property_hash(property)
    property_hash = Hash.new
    property_hash = 
      {
        "address"=> property["property_adress"], 
        "apartment_number"=> property["apartment_no"],
        "postal_code"=> property["zip_code"],
        "city"=> property["town"],
        "country"=> property["country"],
        "description"=> property["property_description"],
        "number_of_bedrooms"=> property["bedrooms_no"],
        "max_guests"=> property["max_people"],
        "internal_id"=> property["source_id"]
      }
  end

	private

	def self.get_properties
		property_data = '{"properties":[{"property_adress":"72 Central Park W","apartment_no":"7","zip_code":"8002","town":"Zurich","country":"Swiss","property_description":"fake description of the property","bedrooms_no":"1","max_people":"2","source_id":"68123"}]}'
	end	
end
