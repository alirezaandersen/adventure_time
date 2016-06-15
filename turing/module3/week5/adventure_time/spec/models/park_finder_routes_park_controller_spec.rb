require 'rails_helper'


RSpec.describe ParkSelector do
  context "routes park finder" do
    it "routes park" do


      expect(ParkSelector.park_finder(type:"state")).to eq nil
    end
  end

  context "routes park finder" do
    it "routes park" do


      expect(ParkSelector.park_finder(type:"national")).to eq nil
    end
  end
end
