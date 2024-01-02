class NatalPlacement < ApplicationRecord
  belongs_to :natal_chart
  belongs_to :celestial_sign
end
