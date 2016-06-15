require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  context "GET #index" do
    it "returns success 200" do

      get :index
      expect(response.status).to eq 200
    end
  end
end
