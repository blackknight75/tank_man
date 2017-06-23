class PhService

  def get_ph_values
    response = Fraday.get("localhost:3000/api/v1/tanks/8/recent-ph?tank_id=8")
    JSON.parse(response.body, symbolize_name: true)
  end
end
