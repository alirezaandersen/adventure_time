class ParksController  < ApplicationController

  def index

  end

  def new
    if params[:zip].nil? || params[:type].nil?
      flash.now[:error] = "Enter Zipcode"
      render :search
    else
      @parks = ParkSelector.park_finder(params)
    end
    params_redirect(params)
  end

  def search
  end

  def national_search
    @national_parks = NationalPark.all
  end

  def directions
    @lat_long = lat_long(params)
    #location = GoogleMapService.new
    #@park_location = location.get_park_address(lat_long(params))
  end

  def lat_long(params)
    lat = params[:lat]
    long = params[:long]
    lat_long = [lat,long]
  end

  def params_redirect(params)
    if params[:type] == "city"
      @image = "http://kcparks.org/wp-content/uploads/2013/03/MillCreekFountain.jpg"
    elsif params[:type] == "state"
      @image = "http://tpwd.texas.gov/state-parks/brazos-bend/gallery/brazos-bend_8275.jpg"
    else params[:type] == "national"
      @image = "http://cdn.jacksonholenet.com/images/content/1814_ydh0Y_Moose_Grand_Teton_md.jpg"
    end
  end
end
