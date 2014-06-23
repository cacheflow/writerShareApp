class UserFriendshipsController < ApplicationController
  def create
    @friendship = current_user.user_friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
        @friendship.create_activity :create, owner: current_user

        flash[:notice] = "You have sent a friend request."
        redirect_to user_path(current_user)
    else
        flash[:error] = "Something went wrong."
        redirect_to user_path(current_user)
    end
  end

  def destroy
    @friendship = current_user.user_friendships.find(params[:id])
    @friendship.create_activity :destroy, owner: current_user

    @friendship.destroy
    #if @friendship = current_user.user_friendships.find(params[:id])
      #@friendship.destroy 
    if @inverse_friend = current_user.inverse_friendship.find(params[:id])
      @inverse_friend.destroy
    end
]    flash[:notice] = "You have removed a friend."
    redirect_to user_path(current_user)
  end
end
