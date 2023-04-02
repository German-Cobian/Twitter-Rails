require 'rails_helper'

RSpec.describe "Tweets", type: :request do
  describe "POST create" do
    context "when user is not logged in" do
        it "responds with redirect" do
        get dashboard_path
        expect(response).to have_http_status(:redirect)
      end
    end

    context "when user is logged in" do
      it "creates a new tweet" do
        user = create(:user)
        sign_in user
        get dashboard_path
        expect(response).to have_http_status(:success)
      end
    end

  end
end
