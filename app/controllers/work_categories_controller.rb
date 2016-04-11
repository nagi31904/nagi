class WorkCategoriesController < ApplicationController
  before_action :set_work_category, :only => [ :show, :edit, :update, :destroy]


  def index
    @work_category = WorkCategory.new
    @work_categories = WorkCategory.all
  end
  def new
    @work_category = WorkCategory.new
  end
  def create
    @work_category = WorkCategory.new(work_category_params)
    if @work_category.save
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
    if @work_category.update(work_category_params)
      flash[:notice] = "book was successfully updated"
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end



  def destroy
    flash[:alert] = "book was successfully deleted"
    @work_category.destroy

    redirect_to :back
  end

  private
  def work_category_params
    params.require(:work_category).permit(:title,:logo)
  end
  def set_work_category
    @work_category = WorkCategory.find(params[:id])
  end

end
