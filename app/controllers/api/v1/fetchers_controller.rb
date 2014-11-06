require 'json'

class Api::V1::FetchersController < ApplicationController

  respond_to :json

  # GET /api/v1/room
  def room
    respond_with Fetcher.new.parse(Fetcher.get_properties)
  end

end
