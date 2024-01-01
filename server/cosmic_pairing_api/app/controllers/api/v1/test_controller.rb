class Api::V1::TestController < ApplicationController
  def index
    render json: {result: "Hello, world! Let the cosmos pair. 🧙‍♂️"}, status: :ok
  end

  def ping
    render json: {result: "pong!"}, status: :ok
  end
end
