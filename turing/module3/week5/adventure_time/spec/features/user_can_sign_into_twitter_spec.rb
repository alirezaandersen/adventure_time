
require "rails_helper"
require "support/authentication"

RSpec.configure do |c|
  c.include Authentication
end

feature "Registered user can log in through twitter" do
  before(:each) do
    stub_omniauth
    VCR.configure do |c|
      c.ignore_request do |request|
        request.uri == "http://maps.googleapis.com/maps/api/geocode/json?address=Denver,%20CO&language=en&sensor=false"
      end
    end
  end

  scenario "they see that they are logged in" do
    visit root_path
    first("#twitter").click
    expect(current_path).to eq(root_path)

    user = User.first

      expect(page).to have_content "Find your Adventure today"
      expect(page).to have_content "current"
      expect(page).to have_content "Logout"

      click_link "Logout"
  end
end
