class AccuWeather

  def self.service
    AccuWeatherService.new
  end

  def self.five_day_forecast(non_format_forecast)
    non_format_forecast.map { |forecast| [forecast[0], forecast[1].values[0].first[1], forecast[1].values[1].first[1]]}
  end

  def self.five_day_forecast_data(key_location)
    json_forecast_results = service.json_request("/forecasts/v1/daily/5day/#{key_location}?apikey=#{ENV["ACCU_WEATHER_KEY"]}")
    forecast_parser(json_forecast_results)
  end

  def self.forecast_parser(json_forecast_results)
    non_format_forecast = service.json_forecast_results[:DailyForecasts].map.with_index { |item, index| [item[:Date].split[0], item[:Temperature]]}
    five_day_forecast(non_format_forecast)
  end
end
