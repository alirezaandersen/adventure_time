class GoogleGeocode

  def self.service
    GoogleGeocodeService.new
  end

  def self.zip_to_long_lat(zip)
    json_results = service.json_request("?&address=#{zip}")
    lng_lat(json_results)
  end

  def self.lng_lat(json_results)
    lat = json_results[:results].first[:geometry][:location][:lat]
    lng = json_results[:results].first[:geometry][:location][:lng]
    location = [lat,lng]
  end

end
