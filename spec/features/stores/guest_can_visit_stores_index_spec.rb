require 'rails_helper'

describe 'when a guest visits store index' do
  it 'they can see a list of stores and infomration about stores' do

    visit stores_path

    within all('#store-info')[0] do
      expect(page).to have_content("Address: 7429 East Iliff Avenue")
    end
  end
end
