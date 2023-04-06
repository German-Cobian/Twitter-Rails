class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  
  validates :body, presence: true, length: { maximum: 280}
  
end
