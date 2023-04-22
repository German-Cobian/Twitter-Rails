class TweetsController < ApplicationController
  before_action :authenticate_user!
  
  def show
    create_view_record unless View.exists?(user: current_user, tweet: tweet)
    @tweet_presenter = TweetPresenter.new(current_user: current_user, tweet: tweet)
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

  def create_view_record
    View.create(user: current_user, tweet: tweet)
  end

end