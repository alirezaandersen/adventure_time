class AccuWeatherService

  def initialize
    @connection = Faraday.new("http://dataservice.accuweather.com/")
    @connection.params["apikey"] = ENV["ACCU_WEATHER_KEY"]
  end

  def json_request(path)
    response = @connection.get(path).body
    JSON.parse(response, symbolize_names: true )
  end
  
end
