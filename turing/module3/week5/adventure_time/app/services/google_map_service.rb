class GoogleMapService

  def initialize
    @connection = Faraday.new("https://maps.googleapis.com/maps/api/staticmap")
    @connection.params['key'] = ENV["GOOGLE_PlACES_API_KEY"]
  end

  def json_request(path)
    response = @connection.get(path).body
    JSON.parse(response, symbolize_names:true)
  end

  def get_park_address(lat_long)
    binding.pry
    json_results = json_request("?center=#{lat_long.first},#{lat_long.last}&zoom=13&size=600x300&maptype=roadmap&marker=color:blue%7C")
    binding.pry
  end
end
