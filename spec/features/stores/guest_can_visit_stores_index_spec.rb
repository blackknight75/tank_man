require 'rails_helper'

describe 'when a guest visits store index' do
  it 'they can see a list of stores and infomration about stores' do
    VCR.use_cassette("stores-index") do
      user = User.new(name: "bob", image_url: "https://pbs.twimg.com/profile_images/2577061185/k5z4q8xqcbwq5zk023v0.png")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit stores_path

      within all('#store-title')[0] do
        expect(page).to have_content("Petland Friscospa")
      end
    end
  end
end
