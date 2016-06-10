class GoogleGeocode

  def self.service
    GoogleGeocodeService.new
  end

  def self.zip_to_long_lat(zip)
    json_results = service.json_request("?&address=#{zip}")
    lng_lat(json_results)
  end

  def self.lat_long_to_zip(lat_long)
    json_results = service.json_request("?latlng=#{lat_long.first},#{lat_long.last}&result_type=postal_code")
    geo_parser(json_results)
  end

  def self.geo_parser(json_results)
    json_results[:results].first[:address_components].map{|e| e if e[:types].include?"postal_code"}.compact.first[:long_name]
  end

  def self.lng_lat(json_results)
    lat = json_results[:results].first[:geometry][:location][:lat]
    lng = json_results[:results].first[:geometry][:location][:lng]
    location = [lat,lng]
  end

end
