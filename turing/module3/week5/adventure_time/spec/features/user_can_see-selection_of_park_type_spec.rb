require 'rails_helper'


RSpec.feature "User can see Park type from root page" do
  scenario "user can see park types" do
      VCR.use_cassette("welcome#index") do
      visit "/"

      expect(current_path).to eq "/"

      first("#main_state").click()
      expect(current_path).to eq "/parks/state_search"
      expect(page).to have_content "This Page Is Currently Under Construction"
    end
  end
end
