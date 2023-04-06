class TweetPresenter
  include ActionView::Helpers::DateHelper
  include Rails.application.routes.url_helpers # The presenter does not have access to the kind of rails route helper methods otherwise

  def initialize(tweet:, current_user:)
    @tweet = tweet
    @current_user = user
  end

  attr_reader :tweet, :current_user

  delegate :user, :body, :likes, :likes_count, to: :tweet
  delegate :username, :display_name, :avatar, to: :user

  def tweet_liked_by_current_user
    @tweet_liked_by_current_user ||= current_user.liked_tweets.include?(tweet)
  end

  # alias method used so as to add the '?' to the 'tweet_liked_by_current_user' method
  alias_method :tweet_liked_by_current_user?, :tweet_liked_by_current_user
  
  # The logic for the following methods was previously in views/tweets/tweet
  
  def tweet_like_or_not_path
    if tweet_liked_by_current_user?
      tweet_like_path(tweet, current_user.likes.find_by(tweet: tweet)) 
    else
      tweet_likes_path(tweet)  
    end
  end

  def turbo_data_method
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
