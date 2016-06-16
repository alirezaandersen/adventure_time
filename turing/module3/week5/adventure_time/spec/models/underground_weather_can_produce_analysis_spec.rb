require 'rails_helper'


RSpec.describe GooglePlace do
  context "returns park by zip" do
    it "get city parks by zip" do
      VCR.use_cassette("GooglePlace#geo_by_location") do

      zip = "80206"

      city = UndergroundWeather.geo_by_location(zip)
      expect(city[:city]).to eq "Denver"
    end
  end
  end
end
