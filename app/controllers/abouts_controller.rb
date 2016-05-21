class AboutsController < ApplicationController
  before_action :set_work_category
  def index
    @user = User.find_by_admin("true")
  end
end
