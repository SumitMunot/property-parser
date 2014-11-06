require 'rails_helper'

RSpec.describe Fetcher, :type => :model do

  describe 'method parse json responce' do
    it 'o/p should be correcct' do
      in_put = JSON.parse Fetcher.get_properties
      out_put = {"room"=>
        {"address"=>"72 Central Park W",
         "apartment_number"=>"7",
         "postal_code"=>"8002",
         "city"=>"Zurich",
         "country"=>"Swiss",
         "description"=>"fake description of the property",
         "number_of_bedrooms"=>"1",
         "max_guests"=>"2",
         "internal_id"=>"68123"}}
      expect(Fetcher.new.parse(Fetcher.get_properties)).to eq(out_put)
      expect(out_put.keys).to eq(['room'])
    end

    it 'out_put should be object of Hash' do
      expect(Fetcher.new.parse(Fetcher.get_properties).class).to eq(Hash)
    end
  end

  describe 'method build_formatted_property_hash' do
    it 'method should assign the value' do
      in_put = JSON.parse Fetcher.get_properties
      out_put = Fetcher.new.build_formatted_property_hash(in_put)
      expect(out_put.keys).to match_array(['address', 'apartment_number', 'postal_code', 'city', 'country', 'description', 'number_of_bedrooms', 'max_guests', 'internal_id'])
    end
  end
end
