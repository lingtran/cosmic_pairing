class NatalChart < ApplicationRecord
  belongs_to :user
  has_many :natal_placements
  has_many :celestial_signs, through: :natal_placements
end
