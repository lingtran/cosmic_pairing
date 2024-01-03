class NatalChart < ApplicationRecord
  belongs_to :user
  has_many :natal_signs
  has_many :celestial_signs, through: :natal_signs
end
