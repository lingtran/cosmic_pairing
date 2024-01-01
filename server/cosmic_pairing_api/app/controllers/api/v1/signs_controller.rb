class Api::V1::SignsController < ApplicationController
  def index
    render json: {signs: Sign.get_all}, status: :ok
  end
end
