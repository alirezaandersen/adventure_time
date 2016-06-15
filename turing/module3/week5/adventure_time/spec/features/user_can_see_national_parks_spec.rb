require 'rails_helper'


RSpec.feature "User can see National Parks" do
  scenario "user can see national park types" do

    visit "/"
    expect(current_path).to eq "/"

    first("#main_national").click()
    expect(current_path).to eq "/parks/national_search"

    expect(page).to have_content "current"
    expect(page).to have_content "Acadia: Maine"
    expect(page).to have_content "Directions"
    expect(page).to have_content "Forecast"
    expect(page).to have_content "Park Info"

  end
end
