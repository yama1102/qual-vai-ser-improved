class GroupedEventsController < ApplicationController
  before_action :set_group_grouped_event, only: %i[index votes]

  def index; end

  def votes; end

  def add_vote
    grouped_event = GroupedEvent.find(params[:grouped_event_id])
    grouped_event.votes += 1
    grouped_event.save
    redirect_to votes_group_grouped_events_path(grouped_event.group)
  end

  private

  def set_group_grouped_event
    @group = Group.find(params[:group_id])
    @grouped_events = GroupedEvent.where({ group_id: params[:group_id] })
  end
end
