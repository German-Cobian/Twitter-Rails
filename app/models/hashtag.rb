class Hashtag < ApplicationRecord
  vaslidates :tag, presence: true, uniqueness: { case_sensitive: false }
end
