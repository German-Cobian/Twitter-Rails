class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @tweets = Tweet.order(created_at: :desc).map { |tweet| TweetPresenter.new(tweet) }
  end

end

# Line was imported from dasboard/index, where it was used in either of the following manners:
# <% Tweet.order(created_at: :desc).map { |tweet| TweetPresenter.new(tweet) }.each do |tweet-presenter| %>
#  <%= render "tweets/tweet", locals: { tweet_presenter: :tweet_presenter } %>
# <% end %>
# 
# Or in this manner using a collection:
# <%= render partial: "tweets/tweet", collection: Tweet.order(created_at: :desc).map { |tweet| TweetPresenter.new(tweet) }, as: :tweet_presenter %>