class ProfilesController < ApplicationController
  def index
    @users = User.all
  end
  def show
   @user = User.find(params[:id])
   @friendship = Friendship.new
   friendships = Friendship.where(user: current_user)
   @friends = []
   friendships.each do |friendship|
    @friends << User.find(friendship.friend_id)
   end
  end
  #  def search
  #   @user = User.search_by_name(params[:email])
  # end
end
