class GroupedEventsController < ApplicationController
  before_action :set_group_grouped_event, only: %i[index votes]

  def index; end

  def votes; end

  def add_vote
    vote_exist = Vote.where(group: params[:group_id], user: current_user)
    grouped_event = GroupedEvent.find(params[:grouped_event_id])
    if vote_exist[0].nil?
      create_vote
      grouped_event.votes += 1
      grouped_event.save
      redirect_to votes_group_grouped_events_path(grouped_event.group), notice: "Votado com sucesso!"
    else
      redirect_to votes_group_grouped_events_path(grouped_event.group), notice: "Não pode votar mais!"
    end
  end

  def result
    @grouped_events = GroupedEvent.where({ group_id: params[:group_id] }).order('votes DESC').limit(1)
  end

  private

  def set_group_grouped_event
    @group = Group.find(params[:group_id])
    @grouped_events = GroupedEvent.where({ group_id: params[:group_id] })
  end

  def create_vote
    vote = Vote.new(group_id: params[:group_id])
    vote.user = current_user
    vote.save
  end
end
