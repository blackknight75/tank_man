require 'rails_helper'

describe 'when a guest visits the root page' do
  it ' they see a button to login' do
    visit root_path

    within('#nav-right') do
      expect(page).to have_button("Sign in with Google")
      expect(page).to_not have_content("logout")
    end
  end
end
