class GoogleGeocodeService

  def initialize
    @connection = Faraday.new(url: "https://maps.googleapis.com/maps/api/geocode/json")
    @connection.params["key"] = ENV["GOOGLE_PlACES_API_KEY"]
  end


  def json_request(path)
    response = @connection.get(path).body
    JSON.parse(response, symbolize_names: true )
  end

end
