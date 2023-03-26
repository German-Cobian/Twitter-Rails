class AddUsernameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string, index: { unique: true }, allow_blank: true
  end
end
