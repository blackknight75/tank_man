require 'rails_helper'


describe "user can" do
  before(:each) do
    billy = User.create(name: "BillyGoat")
    @current_user = User.create(name: "scmountain17", oauth_token: ENV['sc_gauth'], image_url: "https://www.native-instruments.com/fileadmin/userlib/images/2452044_6752.f5d784aa1eabbde15ba5e2d90c3ba828.jpg")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)

    @tank = @current_user.tanks.create(name: "Biggin", size: 125, style: "freshwater", description: "overflow wet/dry filter")
    @current_user.tanks.create(name: "Saltydog", size: 55, style: "Salt", description: "2 blizzard clowns")
    billy.tanks.create(name: "QT", size: 10, style: "coral", description: "not running yet")
  end

  it "see other users tanks" do

    visit user_profile_path(@current_user)

    cards = page.all('.card-content')

    within(cards[0]) do
      expect(page).to have_content("Biggin")
      expect(page).to have_content(125)
    end

    within(cards[1]) do
      expect(page).to have_content("Saltydog")
      expect(page).to have_content(55)
    end

      expect(page).to_not have_content("QT")
      expect(page).to_not have_content(10)
  end

  it "click on tank card, go to tank show" do
    visit dashboard_path(@current_user)

    cards = page.all('.card-reveal')

    within(cards[0]) do
      expect(page).to have_content("Description")
      expect(page).to have_content("overflow")
      click_button "Go to Tank Page"
    end

    expect(current_path).to eq"/user/tank/#{@tank.id}"
  end
end
