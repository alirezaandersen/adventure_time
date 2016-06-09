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

end
