class Api::V1::SunSignsController < ApplicationController
  def index
    render json: {sun_signs: Sun.get_all_signs}, status: :ok
  end
end
