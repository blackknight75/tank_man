require 'rails_helper'

describe "reviews made on store" do
  let(:store) { Store.new(api_data) }
  context 'when stars are clicked' do
    it "returns review on same page" do
      VCR.use_cassette("google_stores_array") do
        expect(Store).to respond_to(:near_by_stores)
      end
    end
  end
end
