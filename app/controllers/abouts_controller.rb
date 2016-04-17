class AboutsController < ApplicationController
  def index
    @user = User.find_by_admin("true")
  end
end
