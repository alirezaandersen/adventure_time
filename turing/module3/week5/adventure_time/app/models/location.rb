class Location < ActiveRecord::Base

  def self.zip_to_long_lat(zip)
    parks = find_by(zip:zip)
    [parks[:lat], parks[:long]]
  end

end
