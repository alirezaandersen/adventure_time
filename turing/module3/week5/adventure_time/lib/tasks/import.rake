require 'csv'

namespace :import do

  desc "import all zipcodes, cities, lat, and long for colorado"

  task all: [:locations,
             :national_parks] do
    "All data has been loaded"
  end

  task locations: :environment do
    locations = "db/data/locations.csv"
    CSV.foreach(locations, headers: :true, header_converters: :symbol) do |row|
      Location.create!(row.to_h)
      print ':) :-) :O :{}'
    end
    puts "Created Locations for Colorado"
  end

  task national_parks: :environment do
    national_parks = "db/data/national_parks.csv"
    CSV.foreach(national_parks, headers: :true, header_converters: :symbol) do |row|
      NationalPark.create!(row.to_h)
      print ':-)'
    end
    puts "Created National Parks Database"
  end
end
