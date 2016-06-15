require 'rails_helper'

RSpec.describe "User stays on search engine if invalid params are given" do
  xscenario "user imputs invalid zipcode does not get redirected" do

    visit '/parks/search'

    fill_in "zipcode", with: nil
    click_on "Search"

    expect(current_path).to eq '/parks/search'

  end
end
