class DropJoinTableCelestialSign < ActiveRecord::Migration[7.1]
  def change
    drop_join_table :celestials, :signs
  end
end
