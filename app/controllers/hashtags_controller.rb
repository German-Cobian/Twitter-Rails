class HashtagsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @hashtags = Hashtag.all
  end
end
