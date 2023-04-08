class RetweetsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @retweet = current_user.retweets.create(tweet: tweet)

  end

  def destroy
    @retweet = tweet.retweets.find(params[:id])
    @retweet.destroy
  end

  private

  def tweet
    @tweet ||= Tweet.find(params[:tweet_id])
  end

end