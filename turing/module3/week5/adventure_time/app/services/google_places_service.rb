class GooglePlacesService

  def initialize
    @connection = Faraday.new(url: "https://maps.googleapis.com/maps/api/place/nearbysearch/json")
    @connection = params["API_KEY"] = ENV["GOOGLE_PlACES_API_KEY"]
  end

  def city_park_search(location)
    json_results = json_request("?location=#{location}&radius=5000&type=parks")
    binding.pry
  end

  def json_request(path)
    response = @connection.get(path).body
    JSON.parse(response, symbolize_names: true)
  end

end
