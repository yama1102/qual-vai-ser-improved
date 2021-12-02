class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :current_event, only: %i[toggle_event_favorites show]
  def index
    @events = Event.all
  end

  def toggle_favorite
    favorite_exist = Favorite.where(event: @event, user: current_user)
    if favorite_exist[0].nil?
      favorite = Favorite.new(params[:event])
      favorite.user = current_user
      favorite.save
      redirect_to profiles_path
    else
      Favorite.destroy(favorite_exist)
    end
  end

  def current_event
    @event = Event.find(params[:id])
  end

  def show

  end
end
