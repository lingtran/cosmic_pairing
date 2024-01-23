class Sign < ApplicationRecord
  include ActiveModel::Serialization

  has_many :celestial_signs
  has_many :celestials, through: :celestial_signs

  enum :element, [:air, :earth, :fire, :water]
  enum :modality, [:cardinal, :fixed, :mutable]

  validates :element, presence: true, allow_nil: false, inclusion: {in: elements.keys, message: "%{value} not a valid element"}
  validates :modality, presence: true, allow_nil: false, inclusion: {in: modalities.keys, message: "%{value} not a valid modality"}
  validates :name, presence: true, allow_nil: false, allow_blank: false

  def self.get_all
    attributes = [:id, :name, :element, :modality]
    all.as_json(only: attributes)
  end

  def traditional_ruler
    Celestial.find(ruling_celestial_id)
  end

  #TODO: populate rulers, dignities
  #TODO: resolve username uniqueness issue
  #TODO: seed natal chart, user, natal signs
end
