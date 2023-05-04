class BookmarksController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @bookmark_tweets = current_user.bookmarked_tweets
    @tweet_presenters = current_user.bookmarked_tweets.map do |tweet|
      TweetPresenter.new(tweet: tweet, current_user: current_user)
    end
  end

  def create
    @bookmark = current_user.bookmarks.create(tweet: tweet)

    if @bookmark.save 
      respond_to do |format|
        format.html { redirect_to dashboard_path }
        format.turbo_stream
      end
    end
  end

  def destroy
    @bookmark = tweet.bookmarks.find(params[:id])
    @bookmark.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_path }
      format.turbo_stream
    end
  end

  private

  def tweet
    @tweet ||= Tweet.find(params[:tweet_id])
  end

end