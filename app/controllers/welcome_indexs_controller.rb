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

      @number_post = @work_post_webs.limit(9)
      @number = @number_post.size
      @number = 9
      @number_v = (@number-1)/3

    else

    end

    @work_post_first_webs = @work_post_webs[0..2]


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
