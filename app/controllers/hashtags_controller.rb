class HashtagsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @hashtags = Hashtag.includes(:tweets)
  end

  def show
    @hashtags = Hashtag.includes(:tweets)
  end
end
