class UndergroundWeather

  def self.service
    UndergroundWeatherService.new
  end

  def self.geo_by_location
    geo_zip = conditions_by_geolookup[:location][:zip]
  condition_by_zip(geo_zip)
  end

  def self.condition_by_zip(zip)
    json_result = service.json_request("conditions/q/%s.json" % [zip.to_s])
    city_temp(json_result)
  end

  def self.conditions_by_geolookup
    json_geo = service.json_request("geolookup/q/autoip.json")
  end

  def self.city_temp(json_result)
    {city: json_result[:current_observation][:display_location][:city],
      temp: json_result[:current_observation][:temperature_string]}
  end

  def self.get_weather_for_parks(parks)
    parks.map { |k,v| [k,UndergroundWeather.condition_by_zip(v[:zipcode])] }.to_h
  end

  def self.condition_by_lat_long(parks)
     lat_long = parse_park_geo(parks)
    json_results = json_request("geolookup/q/#{lat_long.first.first},#{lat_long.first.last}.json")
  end

  def self.conditions_by_zipcodes(*zipcodes)
    zipcodes.map do |zip|
      [zip.to_s, condition_by_zip(zip)]
    end.to_h
  end

  def self.temp()
    if geo_by_locations < 70
      image_tag = cold.png
    else
      image_tag = hot.png
    end
  end 

end
