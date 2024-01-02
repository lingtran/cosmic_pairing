class CreateJoinTableCelestialSign < ActiveRecord::Migration[7.1]
  def change
    create_join_table :celestials, :signs do |t|
      t.integer :essential_dignity, null: true
      t.index [:celestial_id, :sign_id]
      t.index [:sign_id, :celestial_id]
    end
  end
end
