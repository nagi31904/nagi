class PostsController < ApplicationController
  before_action :set_category, :only => [ :new,:show, :edit, :update, :destroy,:index]
  before_action :set_post, :only => [ :show, :edit, :update, :destroy]
  before_action :set_work_category

  def index
    @page = params[:page] ||= "1"
    @categories = @category
    if params[:category_id]
      @posts = Category.find(params[:category_id]).posts
    else
      @posts = Post.page(params[:page]).per(3)
    end
    if params[:sort] == "comment_sort"
      @posts= @posts.order(:comments_count)
    else
      @posts= @posts.order(created_at: :desc)
    end

  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
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
    if @post.update(post_params)
      flash[:notice] = "book was successfully updated"
      redirect_to post_path(params[:id])
    else
      render :action => :edit
    end
  end



  def destroy
    flash[:alert] = "book was successfully deleted"
    @post.destroy

    redirect_to :action => :index
  end

  private
  def post_params
    params.require(:post).permit(:title, :description,:img, :post_category_ids =>[])
  end
  def set_category
    @category = PostCategory.all
  end
  def set_post
    @post = Post.find(params[:id])
  end

end
