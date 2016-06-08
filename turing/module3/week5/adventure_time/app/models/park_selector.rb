class ParkSelector < ActiveRecord::Base


def park_finder(params)
  if params[:type] == "city"
    GoogleGeocode.zip_to_long_lat(@zip)
    GooglePlaceService
  elsif params[:type] == "state"
    puts "state finder"
  else params[:type] == "national"
    puts "national finder"
  end
end

end
