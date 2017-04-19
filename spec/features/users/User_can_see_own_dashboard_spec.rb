require 'rails_helper'

describe "as a user" do

  before(:each) do
    @current_user = User.create(name: "scmountain17", oauth_token: ENV['sc_gauth'], image_url: "https://www.native-instruments.com/fileadmin/userlib/images/2452044_6752.f5d784aa1eabbde15ba5e2d90c3ba828.jpg")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)

    @current_user.tanks.create(name: "Biggin", size: 125, style: "freshwater", description: "overflow wet/dry filter")
    @current_user.tanks.create(name: "Saltydog", size: 55, style: "Salt", description: "2 blizzard clowns")
    @current_user.tanks.create(name: "QT", size: 10, style: "coral", description: "not running yet")
  end

  it "can access dashboard" do
    visit dashboard_path(@current_user)
    expect(page).to have_content("scmountain17")

      expect(page).to have_content("Biggin")
      expect(page).to have_content("Saltydog")
      expect(page).to have_content("QT")

  end
end
