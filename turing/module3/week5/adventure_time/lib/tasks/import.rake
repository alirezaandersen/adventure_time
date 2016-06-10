require 'csv'

namespace :import do

  desc "import all zipcodes, cities, lat, and long for colorado"

  task all: [:locations] do

    "All data has been loaded"
  end

  task locations: :environment do
    locations = "db/data/locations.csv"
    CSV.foreach(locations, headers: :true, header_converters: :symbol) do |row|
      Location.create!(row.to_h)
      print '.'
    end
    puts "Created Locations"
  end
end
