class AccuWeatherService

  def initialize
    @connection = Faraday.new("http://dataservice.accuweather.com/")
    @connection.params["apikey"] = ENV["ACCU_WEATHER_KEY"]
  end

  def location_key(lat_long)
    json_results = json_request("/locations/v1/cities/geoposition/search?apikey=#{ENV["ACCU_WEATHER_KEY"]}&q=#{lat_long.first}%2C#{lat_long.last}")
    key_location = json_results[:Key]
    five_day_forecast(key_location)
  end

  def five_day_forecast(key_location)
    json_forecast_results = json_request("/forecasts/v1/daily/5day/#{key_location}?apikey=#{ENV["ACCU_WEATHER_KEY"]}")
    forecast_parser(json_forecast_results)
  end

  def forecast_parser(json_forecast_results)
    non_format_forecast = json_forecast_results[:DailyForecasts].map.with_index { |item, index| [item[:Date].split[0], item[:Temperature]]}
    # ready_to_format = non_format_forecast.map { |s| s.group_by { |k, v| k } }
    # a = [forecast_days(ready_to_format),maximum_temp(ready_to_format),minimum_temp(ready_to_format)]
    a = non_format_forecast.map { |forecast| [forecast[0], forecast[1].values[0].first[1], forecast[1].values[1].first[1]]}
    binding.pry
  end

  def json_request(path)
    response = @connection.get(path).body
    JSON.parse(response, symbolize_names: true )
  end
end
