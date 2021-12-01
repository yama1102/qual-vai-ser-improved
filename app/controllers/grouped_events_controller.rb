class GroupedEventsController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @grouped_events = GroupedEvent.where({ group_id: params[:group_id] })
  end
end
