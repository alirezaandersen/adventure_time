class UndergroundWeatherService

  def initialize
    @connection = Faraday.new(url: "http://api.wunderground.com/api/#{ENV["UNDERGROUND_APP_KEY"]}/")
    @connection.headers["Authorization"] = ENV["UNDERGROUND_APP_KEY"]
  end

  def json_request(path)
    response = @connection.get(path).body
    JSON.parse(response, symbolize_names: true )
  end

end
