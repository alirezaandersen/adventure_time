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

end
