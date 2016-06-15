class WeathersController <  ApplicationController
  protect_from_forgery :except => :forecast

  def json
    @zip = params[:zip]
    a = respond_with UndergroundWeather.condition_by_zip(@zip).merge(zip:@zip)
  end

  def forecast
    lat_long(params)
    @park_name = params[:name]
    @five_day_forecast = AccuWeather.location_key(lat_long(params))
  end

  def lat_long(params)
    lat = params[:lat]
    long = params[:long]
    lat_long = [lat,long]
  end

end
