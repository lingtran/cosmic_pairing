class Sign < ApplicationRecord
  enum :element, [:air, :earth, :fire, :water]
  enum :modality, [:cardinal, :fixed, :mutable]

  validates :element, presence: true, allow_nil: false, inclusion: {in: elements.keys, message: "%{value} not a valid element"}
  validates :modality, presence: true, allow_nil: false, inclusion: {in: modalities.keys, message: "%{value} not a valid modality"}
  validates :name, presence: true, allow_nil: false, allow_blank: false

  def self.get_all
    all.select(:id, :name, :element, :modality)
  end
end
