class Fish < ApplicationRecord
  belongs_to :tank
  has_many :notes
end
