require 'rails-helper'

describe 'when a guest visits store index' do
  it 'they can see a list of stores and infomration about stores' do

    visit stores_path

    expect(page).to have_content

  end
end
