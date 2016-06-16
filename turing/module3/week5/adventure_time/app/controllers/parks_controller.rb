class ParksController  < ApplicationController
 protect_from_forgery except: :directions

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
    @type = 'national'
  end

  def state_search
  end

  def directions
    @lat_long = lat_long(params)
    @url = "https://www.google.com/maps/embed/v1/place?key=%s&q=%s,%s" % [ENV['GOOGLE_PlACES_API_KEY'],@lat_long[0],@lat_long[1]]
    @url = @url + "&zoom=6" if !params[:type].to_s.empty? && params[:type] == 'national'
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
