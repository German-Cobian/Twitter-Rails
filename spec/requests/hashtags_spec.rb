require 'rails_helper'

RSpec.describe "Hashtags", type: :request do
  let(:user) { create(:user) }
  before { sign_in user }

  describe "GET /index" do
    it "is successful" do
      get hashtags_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "is successful" do
      hashtag = create(:hashtag)
      get hashtag_path(hashtag)
      expect(response).to have_http_status(:success)
    end
  end

end