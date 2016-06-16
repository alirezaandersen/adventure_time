class ParkSelector < ActiveRecord::Base

  def self.park_finder(params)
    if params[:type] == "city"
      GooglePlace.get_city_parks(params[:zip])
    elsif params[:type] == "state"
      puts "state finder"
    elsif params[:type] == "national"
      puts "national finder"
    end
  end

  def self.direction_redirect_style(params)
    @lat_long = lat_long(params)
    @url = "https://www.google.com/maps/embed/v1/place?key=%s&q=%s,%s" % [ENV['GOOGLE_PlACES_API_KEY'],@lat_long[0],@lat_long[1]]
    @url = @url + "&zoom=6" if !params[:type].to_s.empty? && params[:type] == 'national'
    @url
  end

  def self.lat_long(params)
    lat = params[:lat]
    long = params[:long]
    lat_long = [lat,long]
  end

end
