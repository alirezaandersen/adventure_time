require 'rails_helper'

RSpec.feature"User can get directions to park" do
  scenario "user can see parks near them" do
    VCR.use_cassette("parks#search") do
      visit '/parks/search'

      fill_in "zipcode", with: "80206"
      click_on "Search"
      expect(current_path).to eq "/parks/new"

      within(".table-sm") do
        first(".mdirections").click
      end
    end
  end
end
