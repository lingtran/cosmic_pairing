# frozen_string_literal: true

class PopulatePlanets < ActiveRecord::Migration[7.1]
  class MigrationPlanets < ApplicationRecord
    self.table_name = "planets"
  end

  def up
    planets.each do |planet|
      MigrationPlanets.create!(name: planet)
    end
  end

  def down
    planets.each do |planet|
      MigrationPlanets.find_by(name: planet)&.destroy
    end
  end

  private

  def planets
    [
      "mercury",
      "venus",
      "mars",
      "jupiter",
      "saturn",
      "uranus",
      "pluto"
    ]
  end
end
