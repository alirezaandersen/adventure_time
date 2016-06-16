require 'rails_helper'

RSpec.describe ParksController do
  context "can parse lat and lgng" do
    it "can give geo location" do

        park_data= {:lat =>39.866593, :long => -104.7754307}

      expect(ParksController.new.lat_long(park_data)).to eq [39.866593,-104.7754307]
    end
  end
end
