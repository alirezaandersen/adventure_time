class ParksController  < ApplicationController

def new
  # @zip = params[:zip]
  ParkSelector.park_finder(params)
end

def create
   @park = GooglePlacesService.new(params[:type],lng_lat)
   binding.pry
  # @park.zip_to_long_lat(@zip)
end

def search

end

end
