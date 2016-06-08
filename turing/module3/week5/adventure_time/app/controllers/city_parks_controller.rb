class CityParksController < ApplicationController


  def index

  end

  def show

  end

  def create
    binding.pry
    @city = GoogleGeocode.new(params[:zip])
 #create method that exlcudes additional criteria pass parks
  end

  def new
    binding.pry
    @zip = params[:zip]
  end


end
