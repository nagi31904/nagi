class IndexWorkCategoriesController < ApplicationController
  before_action :set_work_category, :only => [:index, :show, :edit, :update, :destroy]
  before_action :set_work_category
  def index
    @work_categories = @work_category
    #@work_posts = Category.find(params[:category_id]).work_posts
  end


  private
  def set_work_category
    @work_category = WorkCategory.all
  end
end
