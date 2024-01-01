class Api::V1::SignsController < ApplicationController
  def index
    render json: {signs: signs}.to_json, status: :ok
  end

  private

  CARDINAL = "CARDINAL"
  FIXED = "FIXED"
  MUTABLE = "MUTABLE"

  FIRE = "FIRE"
  EARTH = "EARTH"
  AIR = "AIR"
  WATER = "WATER"

  def signs
    [
      {
        id: 1,
        name: "aries",
        modality: CARDINAL,
        element: FIRE
      },
      {
        id: 2,
        name: "taurus",
        modality: FIXED,
        element: EARTH
      },
      {
        id: 3,
        name: "gemini",
        modality: MUTABLE,
        element: AIR
      },
      {
        id: 4,
        name: "cancer",
        modality: CARDINAL,
        element: WATER
      },
      {
        id: 5,
        name: "leo",
        modality: FIXED,
        element: FIRE
      },
      {
        id: 6,
        name: "virgo",
        modality: MUTABLE,
        element: EARTH
      },
      {
        id: 7,
        name: "libra",
        modality: CARDINAL,
        element: AIR
      },
      {
        id: 8,
        name: "scorpio",
        modality: FIXED,
        element: WATER
      },
      {
        id: 9,
        name: "sagittarius",
        modality: MUTABLE,
        element: FIRE
      },
      {
        id: 10,
        name: "capricorn",
        modality: CARDINAL,
        element: EARTH
      },
      {
        id: 11,
        name: "aquarius",
        modality: FIXED,
        element: AIR
      },
      {
        id: 12,
        name: "pisces",
        modality: MUTABLE,
        element: WATER
      }
    ]
  end
end
