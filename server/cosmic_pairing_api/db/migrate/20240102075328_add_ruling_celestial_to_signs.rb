class AddRulingCelestialToSigns < ActiveRecord::Migration[7.1]
  def change
    add_reference :signs, :ruling_celestial, foreign_key: {to_table: "celestials"}
  end
end
