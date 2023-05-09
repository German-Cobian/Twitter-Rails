class AddIndexToTagColumnOnHashtags < ActiveRecord::Migration[7.0]
  def change
    add_index :hashtags, :tag
  end
end
