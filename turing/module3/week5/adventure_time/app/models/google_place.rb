class GooglePlace

  def self.service
    GooglePlacesService.new
  end

  def self.get_city_parks(zip)
    lat_lng = GoogleGeocode.zip_to_long_lat(zip)
    location = service.city_park_search(lat_lng)
    find_city_parks(location)
  end

  def self.find_city_parks(location)
    a = location[:results].map do |show|
      if show[:name].downcase.include?("park")
      [show[:name],{address:show[:vicinity],
                    lat_long:show[:geometry].values.first.values,
                    zipcode:GoogleGeocode.long_lat_to_zip(show[:geometry].values.first.values)}
      ]
      end
    end.compact.to_h
  end
end
