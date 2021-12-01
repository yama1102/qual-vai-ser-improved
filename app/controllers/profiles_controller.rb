class ProfilesController < ApplicationController

  def show
   @user = current_user
   @friendships = Friendship.where({ user_id: current_user.id })

  #  @friendship = Friendship.new
  #  friendships = Friendship.where(user: current_user)
  #  @friends = []
  #  friendships.each do |friendship|
  #   @friends << User.find(friendship.friend_id)
  #  end
  end
  #  def search
  #   @user = User.search_by_name(params[:email])
  # end
end
