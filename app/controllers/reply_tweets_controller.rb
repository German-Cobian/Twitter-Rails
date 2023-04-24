class ReplyTweetsController < ApplicationController
  before_action :authenticate_user!

  def create
    @tweet = tweet.reply_tweets.create(tweet_params.merge(user: current_user))
 
    if @tweet.save
      respond_to do |format|
        format.html { redirect_to dashboard_path }
        format.turbo_stream
      end
    end
  end

  private

  def tweet
    @tweet ||= Tweet.find(params[:tweet_id]) # Memoise tweet for use in the show controller (tweet: tweet) and in create_view_record
  end

  def tweet_params
    params.require(:tweet).permit( :body )
  end
end