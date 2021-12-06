
class FriendshipsController < ApplicationController

  def new
    @users = User.where.not(id: current_user)
    @friendship = Friendship.new
  end

  def create
    friendship = Friendship.new
    friendship.user = current_user
    friendship.friend_id = params[:friendship][:user_id]
    friendship.save
    redirect_to profiles_path
  end

  def search
    @friendship = Friendship.new
    @users = User.search_by_email(params[:email])
  end
end
