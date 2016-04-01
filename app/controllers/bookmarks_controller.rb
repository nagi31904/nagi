class BookmarksController < ApplicationController
  before_action :set_bookmark, :only => [ :index ,:show, :edit, :update, :destroy]
  def new

  end
  def create

  end
  def edit

  end
  def update
    
  end
  def destroy

  end




  private
  def set_bookmark
    @bookmarks = Bookmark.all
  end
end
