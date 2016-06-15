require 'rails_helper'

RSpec.describe ParksController do
  context "directions returns lat and lgng" do
    it "can give geo location" do

        geo: {:lat =>39.866593, :long => -104.7754307

      ParksController.new.directions(geo)
