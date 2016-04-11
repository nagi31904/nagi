class WorkPostsController < ApplicationController
  before_action :set_work_category, :only => [:index, :show, :edit, :update, :destroy]

  def index
    @work_categories = @work_category
    @work_posts = WorkCategory.find(params[:work_category_id]).work_posts
  end


  private
  def set_work_category
    @work_category = WorkCategory.all
  end

end
