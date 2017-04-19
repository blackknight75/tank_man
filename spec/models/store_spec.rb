require 'rails_helper'

describe Store do
  let(:store) { Store.new(store_stub) }
  context '.near_by_stores' do
    it "returns array of stores" do
      VCR.use_cassette("google_stores_array", :record => :new_episodes) do
        expect(Store).to respond_to(:near_by_stores)
        expect(Store.near_by_stores('162.216.46.154')).to be_a(Array)
        expect(Store.near_by_stores('162.216.46.154').length).to eq(11)
      end
    end
  end
  context 'model tests' do
    it "returns one store" do
        expect(store.get_yelp_rating(+14698286890)).to be_a(Float)
        expect(store.store_details(store.place_id).length).to eq(20)
        expect(Store.store_details(store.place_id).city).to eq(" Springfield")
        expect(store.store_status(true)).to eq("Open")
    end
  end
end
