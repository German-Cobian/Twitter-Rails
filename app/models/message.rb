class Message < ApplicationRecord
  belongs_to :user
  belongs_to :message_thread

  validates :body, presence: true 
end
