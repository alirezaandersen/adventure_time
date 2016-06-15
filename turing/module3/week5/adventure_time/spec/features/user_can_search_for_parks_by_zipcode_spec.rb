require 'rails_helper'


RSpec.feature"User can search for nearby parks by zipcode" do
  scenario "user can see parks near them" do

    visit '/parks/search'

    fill_in "zipcode", with: "80206"
    click_on "Search"
    # save_and_open_page
      expect(current_path).to eq "/parks/new"
    expect(page).to have_link "Direction"
    expect(page).to have_link "Forecast"


  end
end
