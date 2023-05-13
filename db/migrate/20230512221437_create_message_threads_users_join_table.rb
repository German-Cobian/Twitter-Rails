class CreateMessageThreadsUsersJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :message_threads_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :message_thread

      t.timestamps
    end
  end
end
