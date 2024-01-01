class Api::V1::SignsController < ApplicationController
  def index
    render json: {signs: Sign.get_all}.to_json, status: :ok
  end
end
