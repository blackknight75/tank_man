require 'rails_helper'

describe "as a user" do

  before(:each) do
    @current_user = User.create(name: "scmountain17", oauth_token: ENV['sc_gauth'], image_url: "www.yahoo.com")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)

    @current_user.tanks.create(name: "Biggin", size: 125, style: "freshwater", description: "overflow wet/dry filter")
    @current_user.tanks.create(name: "Saltydog", size: 55, style: "Salt", description: "2 blizzard clowns")
    @current_user.tanks.create(name: "QT", size: 10, style: "coral", description: "not running yet")

  end

  it "can access dashboard" do
    visit "/dashboard"
    expect(page).to have_content("my tanks")

    within ('.mytanks') do
      expect(page).to have_content("tank 1")
      expect(page).to have_content("tank 2")
      expect(page).to have_content("tank 3")
    end


  end
end
