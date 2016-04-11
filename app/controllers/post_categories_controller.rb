class PostCategoriesController < ApplicationController
  before_action :set_post_category, :only => [ :show, :edit, :update, :destroy]


  def index
    @post_category = PostCategory.new
    @post_categories = PostCategory.all
  end
  def new
    @post_category = PostCategory.new
  end
  def create
    @post_category = PostCategory.new(post_category_params)
    if @post_category.save
      redirect_to :action => :index
    else
      render :action => :new
    end
  end
  def show


  end

  def edit

  end



  def update
    if @post_category.update(post_category_params)
      flash[:notice] = "book was successfully updated"
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end



  def destroy
    flash[:alert] = "book was successfully deleted"
    @post_category.destroy

    redirect_to :back
  end

  private
  def post_category_params
    params.require(:post_category).permit(:title)
  end
  def set_post_category
    @post_category = PostCategory.find(params[:id])
  end

end
