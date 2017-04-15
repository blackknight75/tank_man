require 'rails_helper'

describe 'when a user is logged in' do
  it 'they cannot see the login with google button in navbar' do
    user = User.new(name: "bob", image_url: "https://pbs.twimg.com/profile_images/2577061185/k5z4q8xqcbwq5zk023v0.png")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path
    within('#dropdown1') do
      expect(page).to have_content('Logout')
      expect(page).to_not have_button('Sign in with Google')
    end
  end
end
