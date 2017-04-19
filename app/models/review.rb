class Review < ApplicationRecord
belongs_to :user


  def stars
   "★★★★★" if score == 5
    "★★★★" if score == 4
     "★★★" if score == 3
      "★★" if score == 2
       "★" if score == 1
  end

  def user_name
    User.find(user_id).name
  end

end
