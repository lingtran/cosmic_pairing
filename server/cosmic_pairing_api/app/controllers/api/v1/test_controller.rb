class Api::V1::TestController < ApplicationController
  def index
    render json: { result: "hello there!" }.to_json, status: :ok
  end
end
