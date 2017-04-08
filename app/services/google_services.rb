class GoogleServices

  def find_near_by_stores
    stores_raw = Faraday.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=39.615210,-104.758469&radius=16093.4&type=pet_store&keyword=fish&key=#{ENV['google_key']}")
    # store_photos = Faraday.get("https://maps.googleapis.com/maps/api/place/photo?photoreference=CoQBdwAAAJfejBo4nKH_oGl-jMTrYTbr0_z2Xh8e3jT7FDBpm_CG73PxrKe1eTGL8BftIFUxuvUrmM_dWNWPc2XK8y-B2_y9Wbf6BbjjBluh2sa_rPV0ZzZRWHTllQX04GvL5E62Aa1aD9iigT_lMNS2-TCUAZbbqm7xUkuzPyIpr3-Qad5WEhCN84Awdn3hmQWofcQVFNgZGhTla_Cn6-T4vAbRpYcmjTa03Fd5wQ&key=#{ENV['google_key']}")
    parsed_stores = JSON.parse(stores_raw.body, symbolize_names: true)[:results]
  end

  def find_store_map(lat, lng)
    response = Faraday.get("https://maps.googleapis.com/maps/api/staticmap?size=512x512&center=#{lat},#{lng}&key=#{ENV['google_key']}")
    response.body
  end
end
