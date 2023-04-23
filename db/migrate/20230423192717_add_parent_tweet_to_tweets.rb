class AddParentTweetToTweets < ActiveRecord::Migration[7.0]
  def change
    add_column :tweets, :parent_tweet_id, :bigint
  end
end
