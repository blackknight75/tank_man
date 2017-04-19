require 'rails_helper'

describe 'when a user visits a store show page' do
  it 'they can see information about that store' do
    @current_user = User.create(name: "scmountain17", oauth_token: ENV['sc_gauth'], image_url: "https://www.native-instruments.com/fileadmin/userlib/images/2452044_6752.f5d784aa1eabbde15ba5e2d90c3ba828.jpg")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)
    Review.create(place_id: "ChIJ85r6cuY8TIYR4CCzI-BY8KM",body: "this place rules", score: 3, user_id: @current_user.id)
    VCR.use_cassette("store", :record => :new_episodes) do

      visit "/stores/ChIJ85r6cuY8TIYR4CCzI-BY8KM"
      expect(page).to have_content("Petland")
      expect(page).to have_content("scmountain17")
      expect(page).to have_content("this place rules")
      expect(page).to have_content("Total Score: 2.8")
      expect(page).to have_content("Tank Man Score: 3")
      expect(page).to have_content("Yelp Score: 2.5")
      expect(page).to have_content("Google Score: 3.1")
    end
  end
end
