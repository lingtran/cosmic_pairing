# frozen_string_literal: true

class PopulateSigns < ActiveRecord::Migration[7.1]
  class MigrationSigns < ApplicationRecord
    self.table_name = "signs"
  end

  def up
    signs.each do |sign|
      MigrationSigns.create!(sign)
    end
  end

  def down
    signs.each do |sign|
      MigrationSigns.find_by(name: sign[:name])&.destroy
    end
  end

  private

  MODALITIES = {cardinal: 0, fixed: 1, mutable: 2}.freeze
  ELEMENTS = {air: 0, earth: 1, fire: 2, water: 3}.freeze

  def signs
    [
      {
        name: "aries",
        modality: MODALITIES[:cardinal],
        element: ELEMENTS[:fire]
      },
      {
        name: "taurus",
        modality: MODALITIES[:fixed],
        element: ELEMENTS[:earth]
      },
      {
        name: "gemini",
        modality: MODALITIES[:mutable],
        element: ELEMENTS[:air]
      },
      {
        name: "cancer",
        modality: MODALITIES[:cardinal],
        element: ELEMENTS[:water]
      },
      {
        name: "leo",
        modality: MODALITIES[:fixed],
        element: ELEMENTS[:fire]
      },
      {
        name: "virgo",
        modality: MODALITIES[:mutable],
        element: ELEMENTS[:earth]
      },
      {
        name: "libra",
        modality: MODALITIES[:cardinal],
        element: ELEMENTS[:air]
      },
      {
        name: "scorpio",
        modality: MODALITIES[:fixed],
        element: ELEMENTS[:water]
      },
      {
        name: "sagittarius",
        modality: MODALITIES[:mutable],
        element: ELEMENTS[:fire]
      },
      {
        name: "capricorn",
        modality: MODALITIES[:cardinal],
        element: ELEMENTS[:earth]
      },
      {
        name: "aquarius",
        modality: MODALITIES[:fixed],
        element: ELEMENTS[:air]
      },
      {
        name: "pisces",
        modality: MODALITIES[:mutable],
        element: ELEMENTS[:water]
      }
    ]
  end
end
