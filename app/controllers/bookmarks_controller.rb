class BookmarksController < ApplicationController
  before_action :authenticate_user!
  
  def create
    puts "\n\n\n\n\n\n#{previous_controller_name}#{previous_action_name}\n\n\n\n\n\n"
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