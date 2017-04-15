require 'rails_helper'

describe 'when a user visits a store show page' do
  it 'they can see information about that store' do
    user = User.new(name: 'bob', image_url: "https://pbs.twimg.com/profile_images/2577061185/k5z4q8xqcbwq5zk023v0.png")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit store_path('ChIJhYL3eYV9bIcR5gQM9pwB3UY')

    expect(page).to have_content("Aquatic Dog")
  end
end
