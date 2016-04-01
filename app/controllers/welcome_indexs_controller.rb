class WelcomeIndexsController < ApplicationController
  before_action :set_bookmark, :only => [ :blog_index ,:show, :edit, :update, :destroy]
  def blog_index

  end


  private
  def set_bookmark
    @bookmarks = Bookmark.all
  end

end
