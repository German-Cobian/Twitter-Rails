class TweetsController < ApplicationController
  before_action :authenticate_user!
  
  def show
    ViewTweetJob.perform_later(tweet: tweet, user: current_user)
      @tweet_presenter = TweetPresenter.new(tweet: tweet, current_user: current_user)
      @reply_tweets_in_presenter = tweet.reply_tweets.includes(:user, :liked_users, :bookmarked_users).order(created_at: :desc).map do |reply_tweet|
      TweetPresenter.new(tweet: reply_tweet, current_user: current_user)
    end
  end

  def create
    @tweet = Tweet.new(tweet_params.merge(user: current_user))

    if @tweet.save
      respond_to do |format|
        format.html { redirect_to dashboard_path }
        format.turbo_stream
      end
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit( :body )
  end

  def tweet
    @tweet ||= Tweet.find(params[:id]) # Memoise tweet for use in the show controller (tweet: tweet) and in create_view_record
  end

end