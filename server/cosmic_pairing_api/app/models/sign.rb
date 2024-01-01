class Sign < ApplicationRecord
    enum :element, [:air, :earth, :fire, :water], validate: {presence: true, allow_nil: false}
    enum :modality, [:cardinal, :fixed, :mutable], validate: {presence: true, allow_nil: false}
    validates :name, presence: true
end
