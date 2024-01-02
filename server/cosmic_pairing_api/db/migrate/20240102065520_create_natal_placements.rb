class CreateNatalPlacements < ActiveRecord::Migration[7.1]
  def change
    create_table :natal_placements do |t|
      t.references :natal_chart, null: false, foreign_key: true
      t.references :celestial_sign, null: false, foreign_key: true

      t.timestamps
    end
  end
end
