require 'rails_helper'

describe "as a user" do
  user = User.create(name: "scmountain17", oauth_token: ENV['sc_gauth'], image_url: "https://www.native-instruments.com/fileadmin/userlib/images/2452044_6752.f5d784aa1eabbde15ba5e2d90c3ba828.jpg")
  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)

  it "can enter params from dashboard" do
    visit dasboard_path(user.id)

    within('#modal2') do
      click_on ("Params")
    end

    within('#modal3') do
      fill_in :ph , with: (8.0)
      fill_in :ammonia , with: ()
      fill_in :nitrite, with: ()
      fill_in :nitrate, with: ()
      click_on "Submit"
    end


  end
end
