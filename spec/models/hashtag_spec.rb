require 'rails_helper'

RSpec.describe Hashtag, type: :model do
  it { validate_presence_of :tag }
  it { validate_uniqueness_of :tag }.case_insensitive
end
