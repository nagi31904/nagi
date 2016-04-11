class WorkPostsController < ApplicationController
  before_action :set_work_category, :only => [:index, :show, :edit, :update, :destroy]
  before_action :set_work_post, :only => [ :show, :edit, :update, :destroy]

  def index
    @work_categories = @work_category
    @work_posts = WorkCategory.find(params[:work_category_id]).work_posts
  end
  def new
    @work_post = WorkPost.new
  end
  def create
    @work_post = WorkPost.new(work_post_params)
    if @work_post.save
      redirect_to work_post_path(work_post)
    else
      render :action => :new
    end
  end
  def show
    @categories = @category
    @comment = Comment.new
    @comments =  @post.comments


  end

  def edit

  end



  def update
    if @work_post.update(work_post_params)
      flash[:notice] = "book was successfully updated"
      redirect_to work_post_path(params[:id])
    else
      render :action => :edit
    end
  end



  def destroy
    flash[:alert] = "book was successfully deleted"
    @work_post.destroy

    redirect_to :action => :index
  end



  private
  def set_work_category
    @work_category = WorkCategory.all
  end
  def post_params
    params.require(:work_post).permit(:title, :description, :work_category_ids =>[])
  end
  def set_category
    @category = PostCategory.all
  end
  def set_post
    @workpost = WorkPost.find(params[:id])
  end

end
