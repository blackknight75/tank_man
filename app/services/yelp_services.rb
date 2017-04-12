class YelpServices

  def data(name, address)
    binding.pry
      response =  HTTParty.get("https://api.yelp.com/v3/businesses/search/phone?phone=#{phone}",
                                      :headers => { :Authorization => "bearer #{ENV[yelp_access_token]}"})
      data     = JSON.parse(response.body)
      data
    end
  end
