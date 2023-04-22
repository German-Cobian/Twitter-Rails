require 'rails_helper'

RSpec.describe ViewTweetJob, type: :job do
  let(:user) { create(:user) }
  let(:tweet) { create(:tweet) }

  it "creates a view count if tweet has not been viewed" do
    expect do
      described_class.new.perform(tweet: tweet, user: user)
    end.to change { View.count }.by(1)
  end

  it "does not create a view count if tweet has been viewed" do
    create(:view, tweet: tweet, user: user)
    expect do
      described_class.new.perform(user: user, tweet: tweet)
    end.not_to change { View.count }
  end
end
