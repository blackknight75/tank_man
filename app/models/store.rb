class Store
  attr_reader :name,
              :open_now,
              :google_rating,
              :operating_hours,
              :google_embed_key,
              :place_id,
              :operating_hours,
              :display_phone,
              :yelp_rating,
              :street,
              :city,
              :state,
              :zipcode

  def initialize(params)
    @place_id         = params[:place_id]
    @name             = params[:name]
    @store_details    = store_details(place_id)
    @open_now         = store_status(params[:opening_hours][:open_now]) unless params[:opening_hours].nil?
    @lat              = params[:geometry][:location][:lat]
    @lng              = params[:geometry][:location][:lng]
    @google_rating    = params[:rating]
    @google_embed_key = ENV['google_embed_key']
    @operating_hours  = @store_details[:opening_hours][:weekday_text].join(", \n") unless @store_details[:opening_hours].nil?
    @display_phone    = @store_details[:formatted_phone_number]
    @phone            = @store_details[:international_phone_number].gsub(/[^0-9+]/, "") unless @store_details[:international_phone_number].nil?
    @yelp_rating      = get_yelp_rating(@phone)
    @street           = @store_details[:formatted_address].split(",")[0]
    @city             = @store_details[:formatted_address].split(",")[1]
    @state            = @store_details[:formatted_address].split(",")[2][1..2]
    @zipcode          = @store_details[:formatted_address].split(",")[2][4..8]
  end

  def self.near_by_stores(client_ip)
    user_location = GeoIpServices.new.get_location(client_ip)
    stores = GoogleServices.new.find_near_by_stores(user_location)
    stores.map do |store|
      Store.new(store)
    end
  end

  def get_yelp_rating(phone)
    rating = YelpServices.new.data(phone)
  end

  def store_details(place_id)
    store_details = GoogleServices.new.store_details(place_id)
  end

  def self.store_details(place_id)
    store_details = GoogleServices.new.store_details(place_id)
    Store.new(store_details)
  end

  def store_status(open_now)
    return "Open"   if open_now == true
    return "Closed" if open_now == false
  end

  def store_hours(params)
    params[:weekday_text] unless params.nil? || params[:weekday_text] == []
  end

  def self.near_by_stores_search(zipcode)
    stores = GoogleServices.new.find_near_by_stores_search(zipcode)
    stores.map do |store|
      Store.new(store)
    end
  end

  def tank_man_score
    Review.where(place_id: @place_id).sum(:score)
  end
end
