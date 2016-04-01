class WelcomeIndexsController < ApplicationController
  before_action :set_bookmark, :only => [ :index ,:show, :edit, :update, :destroy]


  private
  def set_bookmark
    @bookmarks = Bookmark.all
  end

end
