class CreateHashtagsTweetsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :hashtags_tweets, id: false do |t|
      t.belongs_to :hashtag
      t.belongs_to :tweet

      t.timestamps
    end
  end 
end
