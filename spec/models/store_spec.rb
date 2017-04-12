require 'rails_helper'

describe Store do
  let(:store) { Store.new(api_data) }
  context '.near_by_stores' do
    it "returns array of stores" do
      binding.pry
      VCR.use_cassette("google_stores_array") do
        expect(Store).to respond_to(:near_by_stores)
        expect(Store.near_by_stores).to be_a(Array)
        expect(Store.near_by_stores.length).to eq(11)
      end



    end
  end

end
