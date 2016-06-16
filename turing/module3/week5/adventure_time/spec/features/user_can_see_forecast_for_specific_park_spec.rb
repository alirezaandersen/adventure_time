require 'rails_helper'


RSpec.feature"User can search for nearby parks by zipcode" do
  scenario "user can see parks near them" do
    VCR.use_cassette("park#search") do
      visit '/parks/search'

      fill_in "zipcode", with: "80206"
      click_on "Search"

      expect(current_path).to eq "/parks/new"
      expect(page).to have_link "Direction"
      expect(page).to have_link "Forecast"

      within(".table-sm") do
        first(".card-link").click
      end
      expect(page).to have_content "Date"
      expect(page).to have_content "Low"
      expect(page).to have_content "High"
      expect(page).to have_content "Cheesman Park"
    end
  end
end
