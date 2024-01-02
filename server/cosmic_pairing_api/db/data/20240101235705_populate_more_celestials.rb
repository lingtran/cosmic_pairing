# frozen_string_literal: true

class PopulateMoreCelestials < ActiveRecord::Migration[7.1]
  class MigrationCelestials < ApplicationRecord
    self.table_name = "celestials"
    self.inheritance_column = "overriding type"
  end

  def up
    luminaries.each do |luminary|
      MigrationCelestials.create!(name: luminary, type: luminary.capitalize)
    end
  end

  def down
    luminaries.each do |luminary|
      MigrationCelestials.find_by(name: luminary)&.destroy
    end
  end

  private

  def luminaries
    ["sun", "moon"]
  end
end
