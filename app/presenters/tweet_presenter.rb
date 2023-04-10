class TweetPresenter
  include ActionView::Helpers::DateHelper
  include Rails.application.routes.url_helpers # The presenter does not have access to the kind of rails route helper methods otherwise

  def initialize(tweet:, current_user:)
    @tweet = tweet
    @current_user = user
  end

  attr_reader :tweet, :current_user

  delegate :user, :body, :likes, :likes_count, :retweets_count, to: :tweet
  delegate :username, :display_name, :avatar, to: :user

  # *** Likes section

  def tweet_liked_by_current_user
    @tweet_liked_by_current_user ||= tweet.liked_users.include?(current_user)
  end

  alias_method :tweet_liked_by_current_user?, :tweet_liked_by_current_user
  
  def tweet_like_or_not_path
    if tweet_liked_by_current_user?
      tweet_like_path(tweet, current_user.likes.find_by(tweet: tweet)) 
    else
      tweet_likes_path(tweet)  
    end
  end

  def turbo_liked_data_method
    if tweet_liked_by_current_user?
      "delete"
    else
      "post"
    end
  end

  def like_heart_image
    if tweet_liked_by_current_user?
      "heart-full.png"
    else
      "heart.png"
    end
  end

# *** Bookmarks section

  def tweet_bookmarked_by_current_user
    @tweet_bookmarked_by_current_user ||= tweet.bookmarked_users.include?(current_user)
  end

  alias_method :tweet_bookmarked_by_current_user?, :tweet_bookmarked_by_current_user

  def tweet_bookmarked_or_not_path
    if tweet_bookmarked_by_current_user?
      tweet_bookmark_path(tweet, current_user.bookmarks.find_by(tweet: tweet)) 
    else
      tweet_bookmarks_path(tweet)  
    end
  end

  def turbo_bookmarked_data_method
    if tweet_bookmarked_by_current_user?
      "delete"
    else
      "post"
    end
  end

  def bookmark_image
    if tweet_bookmarked_by_current_user?
      "bookmark-full.svg"
    else
      "bookmark.png"
    end
  end

  def bookmark_text
    if tweet_bookmarked_by_current_user?
      "bookmarked"
    else
      "Bookmark"
    end
  end

  # *** Retweets section

  def tweet_retweeted_by_current_user
    @tweet_retweeted_by_current_user ||= tweet.retweeted_users.include?(current_user)
  end

  alias_method :tweet_retweeted_by_current_user?, :tweet_retweeted_by_current_user

  def tweet_retweeted_or_not_path
    if tweet_retweeted_by_current_user?
      tweet_retweet_path(tweet, current_user.retweets.find_by(tweet: tweet)) 
    else
      tweet_retweets_path(tweet)  
    end
  end

  def turbo_retweeted_data_method
    if tweet_retweeted_by_current_user?
      "delete"
    else
      "post"
    end
  end

  def retweet_image
    if tweet_retweeted_by_current_user?
      "retweet-full.png"
    else
      "retweet.png"
    end
  end

  def created_at
    if(Time.zone.now - tweet.created_at) > 1.day
      tweet.created_at.strftime("%b %-d")
    else
      time_ago_in_words(tweet.created_at)
    end
  end

end

# `delegate: :username, :display_name, :avatar, to: :user` permits a more succinct way of expressing the following methods:
# def username      def display_name      def avatar
#   user.username     user.display_name     user.avatar
# end               end                   end
