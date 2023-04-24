require 'rails_helper'

RSpec.describe "ReplyTweets", type: :request do
 
  describe "POST create" do
    it "creates a reply to a parent tweet" do
      user = create(:user)
      sign_in user
      parent_tweet = create(:tweet)
      expect do
        post tweet_reply_tweets_path(parent_tweet), params: {
          tweet: {
            body: "New reply body"
          }
        }
      end.to change { Tweet.count }.by(1)
      expect(response).to redirect_to(dashboard_path)
    end
  end
end
