class FriendshipsController < ApplicationController
  def create
    friend = User.find(params[:friend])
    current_user.friendships.build(friend_id: friend.id) # build is used to create a new object without saving it to the db
    if current_user.save
      flash[:notice] = 'Friend was successfully added'
    else
      flash[:alert] = 'There was something wrong with the friend request'
    end
    redirect_to my_friends_path
  end

  def destroy
    friendship = current_user.friendships.where(friend_id: params[:id]).first
    friendship.destroy
    flash[:notice] = 'Friendship destroyed'
    redirect_to my_friends_path
  end
end