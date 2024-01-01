require "rails_helper"

RSpec.describe Api::V1::TestController, type: :request do
  describe "GET /" do
    before do
      get "/api/v1/test"
    end

    it "has 200 status code" do
      expect(response.status).to eq 200
    end

    it "returns success response" do
      expect(response.body).to eq({result: "Hello, world! Let the cosmos pair. 🧙‍♂️"}.to_json)
    end
  end

  describe "GET /ping" do
    before do
      get "/api/v1/ping"
    end

    it "has :ok https status" do
      expect(response).to have_http_status :ok
    end

   it "returns success response" do
      expect(response.body).to eq({result: "pong!"}.to_json)
    end
  end
end
