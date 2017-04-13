class YelpServices

  def data(phone)

      response =  HTTParty.get("https://api.yelp.com/v3/businesses/search/phone?phone=#{phone}",
                                      :headers => { :Authorization => "Bearer #{ENV['yelp_access_token']}"})
      data     = JSON.parse(response.body)
      format_data(data)
    end

    def format_data(data)
      if data["businesses"][0].nil?
        return 0
      else
        data["businesses"][0]["rating"]
      end
    end
  end
