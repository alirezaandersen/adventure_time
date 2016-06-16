require 'rails_helper'

RSpec.describe "User can only search for city park with valid zipcode" do
  scenario "user can only find parks by valid zipecode" do
    VCR.use_cassette("parks#search") do
      visit '/parks/search'

      fill_in "zipcode", with: "80206"
      click_on "Search"

      expect(current_path).to eq "/parks/new"
      expect(page).to have_content "Cheesman Park"
    end
  end
end
