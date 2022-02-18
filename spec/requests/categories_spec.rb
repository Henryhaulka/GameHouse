require 'rails_helper'

RSpec.describe "Categories", type: :request do
  describe "GET /Index" do
    it "returns http success" do
      get "/categories/Index"
      expect(response).to have_http_status(:success)
    end
  end

end
