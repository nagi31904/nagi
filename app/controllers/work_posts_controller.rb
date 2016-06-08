class WorkPostsController < ApplicationController
  before_action :set_work_category, :only => [:index,:show, :edit, :update, :destroy]
  before_action :set_work_post, :only => [ :show, :edit, :update, :destroy]
  before_action :set_work_category_id
  before_action :set_work_category
  def index
    workcate=WorkCategory.find_by_id(params[:work_category_id])
    if workcate!=nil
    @work_posts = WorkCategory.find_by_id(params[:work_category_id]).work_posts
    @work_posts= @work_posts.order(created_at: :desc)
    else
      render file: "#{Rails.root}/public/404.html", layout: false, status: 404
    end

  end
  def new

    @work_post = WorkPost.new
  end
  def create

    @work_post = WorkPost.new(work_post_params)
    if @work_post.save
      redirect_to work_post_path(@work_post,:work_category_id => @work_category.id)
    else
      render :action => :new
    end
  end
  def show

    @categories = @category



  end

  def edit

  end



  def update

    if @work_post.update(work_post_params)
      flash[:notice] = "book was successfully updated"
      redirect_to work_post_path(params[:id],:work_category_id => @work_category.id)
    else
      render :action => :edit
    end
  end



  def destroy

    flash[:alert] = "book was successfully deleted"
    @work_post.destroy


    redirect_to work_posts_path(:work_category_id => @work_category.id)
  end



  private
  def set_work_category_id
    @work_category = WorkCategory.find_by_id(params[:work_category_id])
  end
  def set_work_category
    @work_categories = WorkCategory.all
  end
  def work_post_params
    params.require(:work_post).permit(:title, :description,:img,:ved, :work_category_ids =>[])
  end

  def set_work_post
    @work_post = WorkPost.find(params[:id])
  end

end
