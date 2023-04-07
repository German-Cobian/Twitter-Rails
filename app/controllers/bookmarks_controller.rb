class BookmarksController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @bookmark = current_user.bookmarks.create(tweet: tweet)

  end

  def destroy
    @bookmark = tweet.bookmarks.find(params[:id])
    @bookmark.destroy
  end

  private

  def tweet
    @tweet ||= Tweet.find(params[:tweet_id])
  end

end