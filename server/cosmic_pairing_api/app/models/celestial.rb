class Celestial < ApplicationRecord
  has_many :celestial_signs
  has_many :signs, through: :celestial_signs

  validates :name, presence: true, allow_nil: false, allow_blank: false
end
