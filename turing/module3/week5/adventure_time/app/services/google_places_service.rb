class GooglePlacesService

  def initialize
    @connection = Faraday.new(url: "https://maps.googleapis.com/maps/api/place/nearbysearch/json")
    @connection.params["key"] = ENV["GOOGLE_PlACES_API_KEY"]
  end

  def city_park_search(location)
    json_results = json_request("?location=#{location[0]},#{location[1]}&radius=5000&type=park")
  end

  def json_request(path)
    response = @connection.get(path).body
    JSON.parse(response, symbolize_names: true)
  end

end
