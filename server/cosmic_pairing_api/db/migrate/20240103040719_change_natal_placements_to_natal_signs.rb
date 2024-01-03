class ChangeNatalPlacementsToNatalSigns < ActiveRecord::Migration[7.1]
  def change
    rename_table :natal_placements, :natal_signs
  end
end
