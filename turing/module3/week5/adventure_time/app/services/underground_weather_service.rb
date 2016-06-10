class UndergroundWeatherService

  def google_geocode
    GoogleGeocode.new
  end

  def initialize
    @connection = Faraday.new(url: "http://api.wunderground.com/api/#{ENV["UNDERGROUND_APP_KEY"]}/")
    @connection.headers["Authorization"] = ENV["UNDERGROUND_APP_KEY"]
  end

  def test_api
    #http://api.wunderground.com/api/f9bc7bc5873d396b/conditions/q/CA/San_Francisco.json
    json_request("conditions/q/CA/San_Francisco.json")
  end

  def json_request(path)
    response = @connection.get(path).body
    JSON.parse(response, symbolize_names: true )
  end

  def condition_by_lat_long(parks)
     lat_long = parse_park_geo(parks)
    json_results = json_request("geolookup/q/#{lat_long.first.first},#{lat_long.first.last}.json")
  end


  def conditions_by_zipcodes(*zipcodes)
    zipcodes.map do |zip|
      #need to sanitize and validate zip
      [zip.to_s, condition_by_zip(zip)]
    end.to_h
  end
end
