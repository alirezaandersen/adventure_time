require 'rails_helper'

RSpec.describe ParksController do
  context "params_redirects_image" do
    it "params returns state park image" do

      parks_selector = ParksController.new

      state_park_url = "http://tpwd.texas.gov/state-parks/brazos-bend/gallery/brazos-bend_8275.jpg"
      expect(parks_selector.params_redirect(type:"state")).to eq state_park_url
    end
  end

  context "params_redirects_images" do
    it "params returns national park image" do

      parks_selector = ParksController.new

      national_park_url = "http://cdn.jacksonholenet.com/images/content/1814_ydh0Y_Moose_Grand_Teton_md.jpg"
      expect(parks_selector.params_redirect(type:"national")).to eq national_park_url
    end
  end
end
