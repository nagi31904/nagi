class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  before_action :set_work_category
  def show
    @anti_friendships = current_user.anti_friendships.where(:confirm => false)
    @user = User.find(params[:id])
    @my_friendships = current_user.friendships.where(:confirm => true)


  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to root_path
    else
      render "edit"
    end
  end

  protected

  def set_user
    @firs = User.all
  end


  def user_params
    params.require(:user).permit(:time_zone, :first_name, :last_name, :description,:img)
  end

end
