class GooglePlace

  def self.service
    GooglePlacesService.new
  end

  def self.get_city_parks(zip)
    lat_lng = GoogleGeocode.zip_to_long_lat(zip)
    location = service.city_park_search(lat_lng)
    park_lat_long(location)
    find_city_parks(location)
  end

  def self.find_city_parks(location)
    location[:results].map do |show|
      if show[:name].downcase.include?("park")
      [show[:name], show[:vicinity], show[:geometry].values.first.values]
      end
    end.compact
  end

  def self.park_lat_long(location)
    # binding.pry
    location[:results].map do |show|
      if show[:name].downcase.include?("park")
      show[:geometry].values.first.values
      end
    end.compact
  end
end
