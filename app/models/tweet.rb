class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_users, through: :bookmarks, source: :user
  has_many :retweets, dependent: :destroy
  has_many :retweeted_users, through: :retweets, source: :user
  has_many :views, dependent: :destroy
  has_many :viewed_users, through: :views, source: :user
  has_many :reply_tweets, foreign_key: :parent_tweet_id, class_name: "Tweet"
  belongs_to :parent_tweet, foreign_key: :parent_tweet_id, inverse_of: :reply_tweets, class_name: "Tweet", optional: true

  validates :body, presence: true, length: { maximum: 280}
  
end
