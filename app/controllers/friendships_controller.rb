class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.create(:friend_id => params[:friend_id])
    redirect_to :back

  end

  def destroy
    @friendships = current_user.anti_friendships
    @friendship = @friendships.find_by_user_id(params[:friend_id])
    @friendship.destroy
    redirect_to :back
  end

  def confirm
   @my_friendship = current_user.friendships.create(:friend_id => params[:friend_id], :confirm => true)

    @friendship = current_user.anti_friendships.find(params[:id])
    @friendship.confirm = true
    @friendship.save

    redirect_to :back
  end

end
