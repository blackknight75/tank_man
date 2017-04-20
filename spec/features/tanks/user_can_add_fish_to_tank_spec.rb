require 'rails_helper'

describe "when a user visits the user dashboard" do

  before(:each) do
    billy = User.create(name: "BillyGoat")
    @current_user = User.create(name: "scmountain17", oauth_token: ENV['sc_gauth'], image_url: "https://www.native-instruments.com/fileadmin/userlib/images/2452044_6752.f5d784aa1eabbde15ba5e2d90c3ba828.jpg")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)

    @tank = @current_user.tanks.create(name: "Biggin", size: 125, style: "freshwater", description: "overflow wet/dry filter")
    @current_user.tanks.create(name: "Saltydog", size: 55, style: "Salt", description: "2 blizzard clowns")
    billy.tanks.create(name: "QT", size: 10, style: "coral", description: "not running yet")
  end

  xit "they click on add fish fill in form, submit and see fish count incrament up" do
    visit "dashboard/#{@current_user.id}"

    within all('#tank-options')[0] do
      click_on "Add a Fish"
    end


  end
end
