require 'rails_helper'

RSpec.describe GoogleGeocode do
  context "converts lat_long to zip" do
    it "converts lat_long to zip" do

      geo = [39.866593, -104.7754307]

        # geocode.lat_long_to_zip(geo)
        expect(GoogleGeocode.lat_long_to_zip(geo)).to eq "80022"

      end
    end

    context "converts zip to lat_long" do
      it "converts zip to lat_long" do

        zip = "80022"
        geo = [39.866593, -104.7754307]

        expect(GoogleGeocode.zip_to_long_lat(zip)).to eq geo
      end
    end
  end
