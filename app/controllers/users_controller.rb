class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user


  def show

      @user = User.find(params[:id])


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
   @users = User.all
 end

  def user_params
    params.require(:user).permit(:time_zone ,:first_name,:last_name,:description)
  end

end
