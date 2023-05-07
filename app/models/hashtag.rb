class Hashtag < ApplicationRecord
  has_and_belongs_to_many :tweets

  validates :tag, presence: true, uniqueness: { case_sensitive: false }
end
