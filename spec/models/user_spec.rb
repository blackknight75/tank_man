require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    it "should be valid with name" do
      user = User.create(name: "scmountain17", oauth_token: ENV['sc_gauth'], image_url: "https://www.native-instruments.com/fileadmin/userlib/images/2452044_6752.f5d784aa1eabbde15ba5e2d90c3ba828.jpg")
      expect(user).to be_valid
    end
  end
end
