require 'rails_helper'

feature "user goes to stores page" do

  before(:each) do
    @current_user = User.create(name: "scmountain17", oauth_token: ENV['sc_gauth'], image_url: "www.yahoo.com")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)
  end
  scenario "user sees a list of all the stores" do
    VCR.use_cassette("store_index", :record => :new_episodes) do
      visit stores_path

      expect(page).to have_content("Aquatic Dog")
      expect(page).to have_content("TNT")
    end
  end
end
