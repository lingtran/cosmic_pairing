require 'rails_helper'

RSpec.describe Api::V1::TestController, type: :request do
  describe "GET /" do
    it "has 200 status code" do
      get '/api/v2/test'
      expect(response.status).to eq 200
    end
  end

  describe "GET /ping" do
    before do
      get '/api/v1/ping'
    end

    it "has :ok https status" do
      binding.b
      expect(response).to have_http_status :ok
    end

    it "sucessfully responds" do
      expect(response.body).to eq "Hello, world! Let the cosmos pair. 🧙‍♂️"
    end
  end
end
