class Planet < ApplicationRecord
    validates :name, presence: true, allow_nil: false, allow_blank: false
end
