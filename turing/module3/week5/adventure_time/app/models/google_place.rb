class GooglePlace

  def self.service
    GooglePlacesService.new
  end

  def self.get_city_parks(zip)
    lat_lng = Location.zip_to_long_lat(zip)
    location = service.city_park_search(lat_lng)
    Rails.cache.fetch("get_city_parks_#{zip}") do
      find_city_parks(location)
    end
  end

  def self.find_city_parks(location)
    a = location[:results].map do |show|
      if show[:name].downcase.include?("park")
        [show[:name], {address:show[:vicinity],
                           lat:show[:geometry].values.first.values.first,
                          long:show[:geometry].values.first.values.last,
                      lat_long:show[:geometry].values.first.values,
                       zipcode:GoogleGeocode.lat_long_to_zip(show[:geometry].values.first.values)}
        ]
      end
    end.compact.to_h
  end
  
end
