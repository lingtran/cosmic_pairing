class CelestialSign < ApplicationRecord
  belongs_to :celestial
  belongs_to :sign

  enum :essential_dignity, [:domicile, :detriment, :exaltation, :fall]

  validates :celestial, presence: true, allow_nil: false
  validates :essential_dignity, inclusion: {in: essential_dignities.keys, message: "%{value} not a valid essential_dignity"}
  validates :sign, presence: true, allow_nil: false

  def name
    sign.name
  end
end
