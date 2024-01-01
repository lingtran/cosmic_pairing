class ChangePlanetsToCelestials < ActiveRecord::Migration[7.1]
  def change
    rename_table :planets, :celestials
  end
end
