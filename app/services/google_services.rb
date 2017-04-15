class GoogleServices

  def find_near_by_stores
    stores_raw = Faraday.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=39.615210,-104.758469&radius=16093.4&type=pet_store&keyword=fish&key=#{ENV['google_key']}")
    JSON.parse(stores_raw.body, symbolize_names: true)[:results]
  end

  def find_near_by_stores_search(zipcode)
    parsed_zip_code_info = convert_zipcode_to_coordinates(zipcode)
    lat = parsed_zip_code_info[:lat]
    lng = parsed_zip_code_info[:lng]
    stores_raw = Faraday.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{lng}&radius=16093.4&type=pet_store&keyword=fish&key=#{ENV['google_key']}")
    JSON.parse(stores_raw.body, symbolize_names: true)[:results]
  end

  def store_details(place_id)
    raw_store_details = Faraday.get("https://maps.googleapis.com/maps/api/place/details/json?placeid=#{place_id}&key=#{ENV['google_key']}")
    JSON.parse(raw_store_details.body, symbolize_names: true)[:result]
  end

  def convert_zipcode_to_coordinates(zipcode)
    zipcode_info = Faraday.get("https://www.zipcodeapi.com/rest/VtkjiEget7H4Cm3vplUbCrV1w806XLaTfucx9tMCAtHcQKIf6CrJ4nKAvLGtxQmM/info.json/#{zipcode}/degrees")
    JSON.parse(zipcode_info.body, symbolize_names: true)
  end
end
