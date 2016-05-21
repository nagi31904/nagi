class WelcomeIndexsController < ApplicationController
  before_action :set_bookmark, :only => [:blog_index, :show, :edit, :update, :destroy]
  before_action :set_post, :only => [:blog_index, :show, :edit, :update, :destroy]
  before_action :set_info, :only => [:blog_index, :show, :edit, :update, :destroy]
  before_action :set_comment, :only => [:blog_index, :show, :edit, :update, :destroy]
  before_action :set_work_category

  def blog_index




    @infos = @infos.order(created_at: :desc).limit(6)

    @posts = @posts.order(updated_at: :desc).limit(6)


  end


  private
  def set_bookmark
    @bookmarks = Bookmark.all
  end

  def set_post
    @posts = Post.all
  end

  def set_info
    @infos = Info.all
  end

  def set_comment
    @comments = Comment.all
  end

end
