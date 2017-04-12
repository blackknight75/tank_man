class GoogleServices

  def find_near_by_stores
    stores_raw = Faraday.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=39.615210,-104.758469&radius=16093.4&type=pet_store&keyword=fish&key=#{ENV['google_key']}")
    JSON.parse(stores_raw.body, symbolize_names: true)[:results]
  end

  def store_details(place_id)
    raw_store_details = Faraday.get("https://maps.googleapis.com/maps/api/place/details/json?placeid=#{place_id}&key=#{ENV['google_key']}")
    JSON.parse(raw_store_details.body, symbolize_names: true)[:result]
  end
end
