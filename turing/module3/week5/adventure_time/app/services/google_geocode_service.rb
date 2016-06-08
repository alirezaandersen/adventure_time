class GoogleGeocodeService

  def initialize
    @connection = Faraday.new(url: "http://maps.googleapis.com/maps/api/geocode/json")
  end


  def json_request(path)
    response = @connection.get(path).body
    JSON.parse(response, symbolize_names: true )
  end

end
