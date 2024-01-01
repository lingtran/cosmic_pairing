# frozen_string_literal: true

class PopulateSigns < ActiveRecord::Migration[7.1]

  class MigrationSigns < ApplicationRecord
    self.table_name = "signs"

    CARDINAL = :cardinal
    FIXED = :fixed
    MUTABLE = :mutable

    FIRE = :fire
    EARTH = :earth
    AIR = :air
    WATER = :water
  end

  def up
    signs.each do |sign|
      MigrationSigns.create!(sign)
    end
  end

  def down
    MigrationSigns.delete_all
  end

  private 

  def signs
    [
      {
        name: "aries",
        modality: MigrationSigns::CARDINAL,
        element: MigrationSigns::FIRE
      },
      {
        name: "taurus",
        modality: MigrationSigns::FIXED,
        element: MigrationSigns::EARTH
      },
      {
        name: "gemini",
        modality: MigrationSigns::MUTABLE,
        element: MigrationSigns::AIR
      },
      {
        name: "cancer",
        modality: MigrationSigns::CARDINAL,
        element: MigrationSigns::WATER
      },
      {
        name: "leo",
        modality: MigrationSigns::FIXED,
        element: MigrationSigns::FIRE
      },
      {
        name: "virgo",
        modality: MigrationSigns::MUTABLE,
        element: MigrationSigns::EARTH
      },
      {
        name: "libra",
        modality: MigrationSigns::CARDINAL,
        element: MigrationSigns::AIR
      },
      {
        name: "scorpio",
        modality: MigrationSigns::FIXED,
        element: MigrationSigns::WATER
      },
      {
        name: "sagittarius",
        modality: MigrationSigns::MUTABLE,
        element: MigrationSigns::FIRE
      },
      {
        name: "capricorn",
        modality: MigrationSigns::CARDINAL,
        element: MigrationSigns::EARTH
      },
      {
        name: "aquarius",
        modality: MigrationSigns::FIXED,
        element: MigrationSigns::AIR
      },
      {
        name: "pisces",
        modality: MigrationSigns::MUTABLE,
        element: MigrationSigns::WATER
      }
    ]
  end
end
