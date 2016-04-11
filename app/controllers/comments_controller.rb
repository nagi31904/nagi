class CommentsController < ApplicationController
  before_action :authenticate_user!, :only =>[:create,:edit,:destroy]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_comment, :only => [:show, :edit, :destroy, :update]
  before_action :set_post, :only => [:create, :show, :edit, :update, :destroy]


  def new
    @comment = Comment.new
  end

  def create
    if current_user == nil
      flash[:alert] = "sing in"
      redirect_to :back
    else
      @comment = @post.comments.new(comment_params)
      # @comment[:user] = currnet_user
      @comment.user_id = current_user.id

      if @comment.save
        redirect_to :back
      else
        render :action => :new
      end
    end
  end

  def show

  end

  def edit
    if current_user != @comment.user
      redirect_to :back
    end

  end


  def update
    if current_user == @comment.user
      if @comment.update(comment_params)
        flash[:notice] = "book was successfully updated"
        redirect_to post_path(params[:post_id])
      else
        render :action => :edit
      end
    else

    end


  end


  def destroy
    if current_user != @comment.user
      redirect_to :back
    else
      flash[:alert] = "book was successfully deleted"
      @comment.destroy
      respond_to do |format|
        format.js
     end
      #redirect_to post_path(@post,:page => params[:page])

    end
  end

  private
  def comment_params
    params.require(:comment).permit(:description, :post_id => [])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_current_user
    @comment = current_user.comments.find(params[:id])
  end
end
