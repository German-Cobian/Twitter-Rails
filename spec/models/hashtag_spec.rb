require 'rails_helper'

RSpec.describe Hashtag, type: :model do
  it { should have_and_belong_to_many :tweets }
  it { validate_presence_of :tag }
  it { validate_uniqueness_of(:tag).case_insensitive }
end
