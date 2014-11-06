require 'json'

class Api::V1::FetchersController < ApplicationController
  before_action :set_properties

  respond_to :json

  # GET /api/v1/room
  def room
    fetcher = Fetcher.new
    room_json = fetcher.parse(@property)

    respond_with room_json
  end

  private
    # Use callback to share common setup or constraints between actions.
    # fetches the property
    def set_properties
      @property = Fetcher.get_properties
    end
end
