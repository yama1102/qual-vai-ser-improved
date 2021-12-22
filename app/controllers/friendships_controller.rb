class FriendshipsController < ApplicationController
  def new
    if params[:nickname].nil?
      @users = User.where.not(id: current_user)
    else
      @users = User.search_by_nickname(params[:nickname])
    end
    @friendship = Friendship.new
  end

  def create
    friendship = Friendship.new
    friendship.user = current_user
    friendship.friend_id = params[:friendship][:user_id]
    friendship.save
    redirect_to new_friendship_path
  end

  def destroy
    friend = Friendship.where({user: current_user, friend: params[:id]})
    friend[0].destroy
    redirect_to new_friendship_path
  end

  def search
    @friendship = Friendship.new
    @users = User.search_by_nickname(params[:nickname])
  end
end
