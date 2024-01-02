class CreateCelestialSign < ActiveRecord::Migration[7.1]
  def change
    create_table :celestial_signs do |t|
      t.integer :essential_dignity, null: true
      t.references :celestial, null: false, foreign_key: true
      t.references :sign, null: false, foreign_key: true

      t.timestamps
    end
  end
end
