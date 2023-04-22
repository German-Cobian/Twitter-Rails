require 'rails_helper'

RSpec.describe "Tweets", type: :request do
  describe "GET show" do
    let(:user) { create(:user) }
    let(:tweet) { create(:tweet) }
    before { sign_in user }

    it "displays the individual tweet" do
      get tweet_path(tweet)
      expect(response).to have_http_status(:success)
    end

    it "increments the view count if tweet has not been viewed" do
      expect { get tweet_path(tweet) }.to change { View.count }.by(1)
    end

    it "does not increment the view count if tweet has been viewed" do
      create(:view, user: user, tweet: tweet)
      expect { get tweet_path(tweet) }.not_to change { View.count }
    end
  end

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
