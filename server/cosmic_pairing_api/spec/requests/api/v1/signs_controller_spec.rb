require "rails_helper"

RSpec.describe Api::V1::SignsController, type: :request do
  describe "GET /" do
    let!(:sign) { create(:sign) }

    before do
      get "/api/v1/signs"
    end

    it "has 200 status code" do
      expect(response).to have_http_status :ok
    end

    it "returns success response" do
      expect(response.body).to eq({signs: [{id: sign.id, name: sign.name, modality: sign.modality, element: sign.element}]}.to_json)
    end
  end
end
