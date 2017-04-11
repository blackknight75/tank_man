class Store
  attr_reader :name,
              :address,
              :open_now,
              :map,
              :google_rating,
              :operating_hours,
              :google_embed_key,
              :lat,
              :lng,
              :place_id

  def initialize(params)
    @place_id        = params[:place_id]
    @name            = params[:name]
    @address         = params[:vicinity]
    @open_now        = store_status(params[:opening_hours][:open_now]) unless params[:opening_hours].nil?
    @lat             = params[:geometry][:location][:lat]
    @lng             = params[:geometry][:location][:lng]
    @google_rating   = params[:rating]
    @google_embed_key = ENV['google_embed_key']
    @operating_hours = store_hours(params[:opening_hours])
  end

  def self.near_by_stores
    stores = GoogleServices.new.find_near_by_stores
    stores.map do |store|
      Store.new(store)
    end
  end

  def store_status(open_now)
    return "Open"   if open_now == true
    return "Closed" if open_now == false
  end

  def store_hours(params)
    params[:weekday_text] unless params.nil? || params[:weekday_text] == []
  end
end
