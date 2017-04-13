class YelpServices

  def data(phone)

      response =  HTTParty.get("https://api.yelp.com/v3/businesses/search/phone?phone=#{phone}",
                                      :headers => { :Authorization => "Bearer #{ENV['yelp_access_token']}"})
      data     = JSON.parse(response.body)
      data
    end
  end
