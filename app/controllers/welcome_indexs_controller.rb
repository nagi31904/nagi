class WelcomeIndexsController < ApplicationController
  before_action :set_bookmark, :only => [:blog_index]
  before_action :set_post, :only => [:blog_index]
  before_action :set_info, :only => [:blog_index]
  before_action :set_comment, :only => [:blog_index]
  before_action :set_work_category

  def blog_index

    work_post_ca_webs = WorkCategory.find_by_title("web")


    if work_post_ca_webs != nil

      @work_category_id=WorkCategory.find_by_title("web").id
      @work_post_webs=work_post_ca_webs.work_posts
      @work_post_webs = @work_post_webs.limit(9)
      @number_post = @work_post_webs.limit(9)
      @number = @number_post.size

      @number_v = (@number-1)/3

    else

    end





    @infos = @infos.order(created_at: :desc).limit(9)
    @number_info = @infos.size
    @number_info_v = ( @number_info-1)/3

    @posts = @posts.order(updated_at: :desc).limit(9)
    @number_post = @posts.size
    @number_post_v = ( @number_post-1)/3


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
