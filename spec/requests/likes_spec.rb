require 'rails_helper'

RSpec.describe "Likes", type: :request do
  let(:user) { create(:user) }
  let(:tweet) { create(:tweet) }
  before { sign_in user }

  describe "POST create" do
    it "creates a new like" do
      expect do
      post tweet_likes_path(tweet)
      end.to change { Like.count }.by(1)
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE destroy" do
    context "when user is not logged in" do
        it "deletes a like" do
          like = create(:like, user: user, tweet: tweet)
          expect do 
            delete tweet_like_path(tweet, like)
          end.to change { Like.count }.by(-1)
        expect(response).to have_http_status(:success)
      end
    end
  end

end

# Neither of these test pass, due to turbo_stream format problems