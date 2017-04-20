class Review < ApplicationRecord
belongs_to :user


  def stars
   return "★★★★★" if score == 5
   return "★★★★" if score == 4
   return "★★★" if score == 3
   return "★★" if score == 2
   return "★" if score == 1
  end

  def user_name
    User.find(user_id).name
  end

end
