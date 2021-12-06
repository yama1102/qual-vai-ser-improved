class GroupChannel < ApplicationCable::Channel
  def subscribed
    group = Group.find(params[:id])
    stream_for group
    # stream_from "some_channel"
  end

  # def unsubscribed
  #   # Any cleanup needed when channel is unsubscribed
  # end
end
