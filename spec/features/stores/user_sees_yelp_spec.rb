require 'rails_helper'

describe "as a user " do
  it "can see yelp at /stores " do
    visit '/stores'

    expect(page).to have_content('yelp review')
  end
end
