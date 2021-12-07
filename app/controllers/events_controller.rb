class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :current_event, only: %i[toggle_favorite show]

  def index
    @events = Event.all
  end

  def toggle_favorite
    favorite_exist = Favorite.where(event: @event, user: current_user)
    if favorite_exist[0].nil?
      @favorite = Favorite.new(event: @event)
      @favorite.user = current_user
      @favorite.save!
    else
      favorite_exist.each(&:destroy)
    end
  end

  def show
    if @event.latitude && @event.longitude
      @markers = [
        {
          lat: @event.latitude,
          lng: @event.longitude,
          image_url: helpers.asset_url('party1.png')
        }
      ]
    end
  end

  def search
    date = l( Date.parse(params[:date]), format: :long ) rescue nil
    @events = Event.global_search(params[:region])
    @events = @events.where("date ILIKE ?", "%#{date}%") if date
  end

  private

  def current_event
    @event = Event.find(params[:id])
  end
end
