require 'rails_helper'

RSpec.describe "Tweets", type: :request do
  describe "GET show" do
    let(:user) { create(:user) }
    let(:tweet) { create(:tweet) }
    before { sign_in user }
    before do
      sign_in user
      allow(ViewTweetJob).to receive(:perform_later)
    end

    it "displays the individual tweet" do
      get tweet_path(tweet)
      expect(response).to have_http_status(:success)
    end

    it "queues up ViewTweetJob" do
      get tweet_path(tweet)
      expect(ViewTweetJob).to have_received(:perform_later).with(user: user, tweet: tweet)
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
