class Review < ApplicationRecord
belongs_to :user


  def stars
    if score == 5
      "★★★★★"
    elsif score == 4
      "★★★★"
    elsif score == 3
      "★★★"
    elsif score == 2
      "★★"
    else score == 1
      "★"
    end
  end

  def user_name
    User.find(user_id).name
  end

end
