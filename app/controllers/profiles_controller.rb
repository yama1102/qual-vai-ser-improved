class ProfilesController < ApplicationController

  def favorites
    @favorite = Favorite.new(user: current_user)
  end


  def show
   @friendships = Friendship.where({ user_id: current_user.id })
  end
end
