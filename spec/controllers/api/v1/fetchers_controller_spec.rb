
require 'rails_helper'

describe Api::V1::FetchersController, :type => :controller do
  describe 'room method' do
    it 'response should be 200' do
      get :room, format: :json
      expect(response).to be_success
    end

    it 'response status should be 200' do
      get :room, format: :json
      expect(response.status).to eq(200)
    end

    it 'should set instace variable' do
      get :room, format: :json
      expect(json).to eq({"room"=>
        {"address"=>"72 Central Park W",
         "apartment_number"=>"7",
         "postal_code"=>"8002",
         "city"=>"Zurich",
         "country"=>"Swiss",
         "description"=>"fake description of the property",
         "number_of_bedrooms"=>"1",
         "max_guests"=>"2",
         "internal_id"=>"68123"}})
    end
  end
end