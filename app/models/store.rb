class Store
  attr_reader :name,
              :address,
              :open_now,
              :google_rating,
              :operating_hours,
              :google_embed_key,
              :place_id,
              :operating_hours,
              :display_phone

  def initialize(params)
    @place_id        = params[:place_id]
    @name            = params[:name]
    @address         = params[:vicinity]
    @store_details   = store_details(place_id)
    @open_now        = store_status(params[:opening_hours][:open_now]) unless params[:opening_hours].nil?
    @lat             = params[:geometry][:location][:lat]
    @lng             = params[:geometry][:location][:lng]
    @google_rating   = params[:rating]
    @google_embed_key = ENV['google_embed_key']
    @operating_hours = @store_details[:opening_hours][:weekday_text].join(", \n") unless @store_details[:opening_hours].nil?
    @display_phone   = @store_details[:formatted_phone_number]
    @phone           = @store_details[:international_phone_number].gsub(/[^0-9+]/, "")
    @yelp_rating     = yelp_rating(@phone)
  end

  def self.near_by_stores
    stores = GoogleServices.new.find_near_by_stores
    stores.map do |store|
      Store.new(store)
    end
  end

  def yelp_rating(phone)
    rating = YelpServices.new.data(phone)
    end
  def store_details(place_id)
    store_details = GoogleServices.new.store_details(place_id)
  end

  def store_status(open_now)
    return "Open"   if open_now == true
    return "Closed" if open_now == false
  end

  def store_hours(params)
    params[:weekday_text] unless params.nil? || params[:weekday_text] == []
  end

end
