require 'rails_helper'

RSpec.describe GoogleGeocode do
  context "converts lat_long to zip" do
    it "converts lat_long to zip" do
      VCR.use_cassette("GoogleGeocode#lat_long_to_zip") do

        geo = [39.866593, -104.7754307]

        expect(GoogleGeocode.lat_long_to_zip(geo)).to eq "80022"
      end
    end

    context "converts zip to lat_long" do
      it "converts zip to lat_long" do
        VCR.use_cassette("GoogleGeocode#zip_to_long_lat") do

          zip = "80022"
          geo = [39.866593, -104.7754307]

          expect(GoogleGeocode.zip_to_long_lat(zip)).to eq geo
        end
      end
    end
  end
end
