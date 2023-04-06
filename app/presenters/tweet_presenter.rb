class TweetPresenter
  include ActionView::Helpers::DateHelper

  def initialize(tweet:, current_user:)
    @tweet = tweet
    @current_user = user
  end

  attr_reader :tweet, :current_user

  delegate :user, :body, :likes, :likes_count, to: :tweet
  delegate :username, :display_name, :avatar, to: :user

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
