class ProfilesController < ApplicationController

  def show
   @user = current_user
   @friendships = Friendship.where(user_id: current_user.id)
  end
end
