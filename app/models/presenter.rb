class Presenter

  def user_count
    User.all.count
  end

  def review_count
    Review.all.count
  end

  def tank_count
    Tank.all.count
  end
end
