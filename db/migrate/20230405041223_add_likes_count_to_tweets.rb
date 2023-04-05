class AddLikesCountToTweets < ActiveRecord::Migration[7.0]
  def change
    add_column :tweets, :likes, :integer, null: false, default: 0
  end
end
