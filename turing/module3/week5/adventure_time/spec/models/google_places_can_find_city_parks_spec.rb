require 'rails_helper'


RSpec.describe GooglePlace do
  context "returns park by zip" do
    it "get city parks by zip" do
      VCR.use_cassette("GooglePlace#get_city_parks") do

        zip = "80206"
        parks = GooglePlace.get_city_parks(zip)
        assert parks.has_key?"Alamo Placita Park"
        expect(parks["Alamo Placita Park"][:lat]).to eq 39.7204627
        expect(parks["Alamo Placita Park"][:long]).to eq -104.9757589
        expect(parks["Alamo Placita Park"][:address]).to eq "East 3rd Avenue, Denver"
        expect(parks["Alamo Placita Park"][:zipcode]).to eq "80218"
      end
    end

    context "find_city_parks by location" do
      it "can located parks near by " do
        VCR.use_cassette("GooglePlace#find_city_parks") do

          lat_lng = [39.7204627,-104.9757589]

          location = GooglePlacesService.new.city_park_search(lat_lng)

          parks = GooglePlace.find_city_parks(location)

          assert parks.has_key?"Alamo Placita Park"
          expect(parks["Alamo Placita Park"][:lat]).to eq 39.7204627
          expect(parks["Alamo Placita Park"][:long]).to eq -104.9757589
          expect(parks["Alamo Placita Park"][:address]).to eq "East 3rd Avenue, Denver"
          expect(parks["Alamo Placita Park"][:zipcode]).to eq "80218"
        end
      end
    end
  end
end
