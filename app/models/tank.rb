class Tank < ApplicationRecord
  belongs_to :user
  has_many :fish

  def new_tank
    Tank.new
  end

  def new_fish
    Fish.new
  end

  def fish_count
    fish.count
  end
end
