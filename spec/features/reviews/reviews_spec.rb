require 'rails_helper'

describe "reviews made on store" do

  before(:each) do
    @store = 'ChIJ85r6cuY8TIYR4CCzI-BY8KM'
    @current_user = User.create(name: "scmountain17", oauth_token: ENV['sc_gauth'], image_url: "www.yahoo.com")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)
    Review.create(place_id: @store, score: 3, user_id: @current_user.id, body: "this place rules")

  end

  context 'when stars are clicked' do
    it "returns review on same page" do
      VCR.use_cassette("store") do
        visit "/stores/ChIJ85r6cuY8TIYR4CCzI-BY8KM"

        within('#rating') do
          fill_in "review", with: "Turrable"
          select "★"
        end

        expect(page).to have_content("scmountain17")
        expect(page).to have_content("this place rules")
        expect(page).to have_content("Total Score: 2.87")
        expect(page).to have_content("Tank Man Score: 3")
        expect(page).to have_content("Yelp Score: 2.5")
        expect(page).to have_content("Google Score: 3.1")
      end
    end
  end
end
