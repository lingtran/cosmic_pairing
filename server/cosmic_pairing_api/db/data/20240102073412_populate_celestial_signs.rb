# frozen_string_literal: true

class PopulateCelestialSigns < ActiveRecord::Migration[7.1]
  class MigrationCelestialSigns < ApplicationRecord
    self.table_name = "celestial_signs"
  end

  class MigrationCelestials < ApplicationRecord
    self.table_name = "celestials"
    self.inheritance_column = "ignore_for_this_migration"
  end

  class MigrationSigns < ApplicationRecord
    self.table_name = "signs"
  end

  def up
    MigrationCelestials.all.each do |celestial|
      MigrationSigns.all.each do |sign|
        MigrationCelestialSigns.create!(celestial_id: celestial.id, sign_id: sign.id)
      end
    end
  end

  def down
    MigrationCelestials.all.each do |celestial|
      MigrationSigns.all.each do |sign|
        MigrationCelestialSigns.find_by(celestial_id: celestial.id, sign_id: sign.id)&.destroy
      end
    end
  end
end
