class GeoIpServices

  def get_location(client_ip)
    location = Faraday.get("http://freegeoip.net/json/#{client_ip}")
    JSON.parse(location.body, symbolize_names: true)
  end
end
