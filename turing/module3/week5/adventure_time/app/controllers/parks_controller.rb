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
    @url = ParkSelector.direction_redirect_style(params)
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
