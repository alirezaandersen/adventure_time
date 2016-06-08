class GoogleGeocode

  def initialize
    @connection = Faraday.new(url: "http://maps.googleapis.com/maps/api/geocode/json?&")
    @connection.headers["API_KEY"] = ENV["GOOGLE_PlACES_API_KEY"]
  end

  def test_api(zipcode)
    json_request("address=#{zipcode}")
  end

  def zip_to_long_lat

  end

  def json_request(path)
    response = @connection.get(path).body
    JSON.parse(response, symbolize_names: true )
  end 

end
