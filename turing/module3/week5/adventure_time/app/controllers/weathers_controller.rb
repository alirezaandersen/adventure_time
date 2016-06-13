class WeathersController <  ApplicationController
  protect_from_forgery :except => :forecast

  def index
    @weather = UndergroundWeatherService.new
    @conditions = @weather.conditions_by_zipcodes('80204', 90242)
  end

  def new
    @zip = params[:zip]
    @weather =UndergroundWeatherService.new
    @conditions = @weather.condition_by_zip(@zip)
  end

  def create
    @weather = UndergroundWeatherService.new(params[:zip])
  end

  def show
    #  @city = params[:id]
    #binding.pry
     @lat_long = params[:id]
    #  @five_day_forecast = OpenWeather.five_day_forecast(@city)
     @five_day_forecast = AccuWeather.five_day_forecast(@lat_long)
  end

  def json
    @zip = params[:zip]
    a = respond_with UndergroundWeather.condition_by_zip(@zip).merge(zip:@zip)
  end

  def forecast
    lat_long(params)
    @five_day_forecast = AccuWeather.location_key(lat_long(params))
  end

  def lat_long(params)
    lat = params[:lat]
    long = params[:long]
    lat_long = [lat,long]
  end

end
