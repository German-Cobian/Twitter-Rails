class Following < ApplicationRecord
  belongs_to :user
  belongs_to :following_user
end
