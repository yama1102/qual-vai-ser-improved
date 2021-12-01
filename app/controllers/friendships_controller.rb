class FriendshipsController < ApplicationController
  def new

  end

  def create
   @friendship = Friendship.new(friendship_params)
   @friendship.user = current_user
   if @friendship.save
    user = User.find(@friendship.friend_id) # indo no banco db e procurando o id do friend q acabei de add
    redirect_to profile_path(user)
   else
    render "profiles/show"
   end
  end

  private
  def friendship_params
    params.require(:friendship).permit(:friend_id)
  end
end
