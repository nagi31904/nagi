class InfosController < ApplicationController
  before_action :set_info, :only => [ :show, :edit, :update, :destroy]
  before_action :set_work_category

  def index
    @infos = Info.all
    if params[:sort] == "comment_sort"
      @infos= @infos.order(:comments_count)
    else
      @infos= @infos.order(created_at: :desc)
    end
  end
  def new
    @info = Info.new
  end
  def create
    @info = Info.new(info_params)
    if @info.save
      redirect_to info_path(@info)
    else
      render :action => :new
    end
  end
  def show


  end

  def edit

  end



  def update
    if @info.update(info_params)
      flash[:notice] = "book was successfully updated"
      redirect_to info_path(params[:id])
    else
      render :action => :edit
    end
  end



  def destroy
    flash[:alert] = "book was successfully deleted"
    @info.destroy

    redirect_to :action => :index
  end

  private
  def info_params
    params.require(:info).permit(:title, :description,:img)
  end
  def set_info
    @info = Info.find(params[:id])
  end

end
