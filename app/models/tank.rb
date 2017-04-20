class Tank < ApplicationRecord
  belongs_to :user
  has_many :fish

  def self.new_tank
    Tank.new
  end

  def self.new_fish
    Fish.new
  end

  def fish_count
    fish.count
  end
end
