class ProfilesController < ApplicationController
#  before_action :user_params
  def favorites
    @favorite = Favorite.new(user: current_user)
  end

  def show
    @user = current_user
    @friendships = Friendship.where({ user_id: current_user.id })
  end

end
