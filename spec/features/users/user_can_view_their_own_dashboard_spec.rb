require 'rails_helper'


describe "user can" do
  before(:each) do
    @current_user = User.create(name: "scmountain17", oauth_token: ENV['sc_gauth'], image_url: "https://www.native-instruments.com/fileadmin/userlib/images/2452044_6752.f5d784aa1eabbde15ba5e2d90c3ba828.jpg")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)

    @tank = @current_user.tanks.create(name: "Biggin", size: 125, style: "freshwater", description: "overflow wet/dry filter")
    @current_user.tanks.create(name: "Saltydog", size: 55, style: "Salt", description: "2 blizzard clowns")
    @current_user.tanks.create(name: "QT", size: 10, style: "coral", description: "not running yet")
  end

  it "visit dashboard page" do
    visit dashboard_path(@current_user)
    expect(page).to have_content("scmountain17")

    within ('#dropdown1')do
      click_on "Dashboard"
    end

    expect(current_path).to eq("/dashboard/#{@current_user.id}")
    expect(page).to have_content("scmountain17")

    cards = page.all('.card-content')

    within all('#tank-details')[0] do
      expect(page).to have_content("Biggin")
      expect(page).to have_content(125)
    end

    within all('#tank-details')[1] do
      expect(page).to have_content("Saltydog")
      expect(page).to have_content(55)
    end

    within all('#tank-details')[2] do
      expect(page).to have_content("QT")
      expect(page).to have_content(10)
    end
  end

  it "click on tank card, go to tank show" do
    visit dashboard_path(@current_user)

    cards = page.all('.card-reveal')

    within(cards[0]) do
      expect(page).to have_content("Description")
      expect(page).to have_content("overflow")
      click_button "Go to Tank Page"
    end

    expect(current_path).to eq"/user/tanks/#{@tank.id}"
  end
end
