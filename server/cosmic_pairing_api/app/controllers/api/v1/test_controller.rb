class Api::V1::TestController < ApplicationController
  def index
    render json: {result: "Hello, world! Let the cosmos pair. 🧙‍♂️"}.to_json, status: :ok
  end

  def ping
    render json: {result: "pong!"}.to_json, status: :ok
  end
end
