class WelcomeIndexsController < ApplicationController
  before_action :set_bookmark, :only => [ :blog_index ,:show, :edit, :update, :destroy]
  before_action :set_post, :only => [ :blog_index ,:show, :edit, :update, :destroy]
  before_action :set_info, :only => [ :blog_index ,:show, :edit, :update, :destroy]
  before_action :set_comment, :only => [ :blog_index ,:show, :edit, :update, :destroy]
  def blog_index

    @work_category = WorkCategory.find_by_title("ills")
    @work_posts = WorkCategory.find_by_title("ills").work_posts
    @work_posts= @work_posts.order(created_at: :desc).limit(9)

    @infos = @infos.order(created_at: :desc).limit(6)

    @posts = @posts.order(updated_at: :desc).limit(6)
    @work_post_first = @work_posts.first

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
