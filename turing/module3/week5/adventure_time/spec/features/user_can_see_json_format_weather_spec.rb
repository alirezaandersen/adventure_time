require 'rails_helper'

RSpec.describe " User can see weather in json format" do
  scenario " weather is return in json format" do
    VCR.use_cassette("weathers#json") do
      visit "/json/weather?zip=80203"

      expect(current_path).to eq "/json/weather"

      expect(page).to have_content "city"
      expect(page).to have_content "temp"
      expect(page).to have_content "zip"
    end
  end
end
