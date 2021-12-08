class GroupedEventsController < ApplicationController
  before_action :set_group_grouped_event, only: %i[index votes]

  def index
    date = l( Date.parse(params[:date]), format: :long ) rescue nil
    @events = Event.global_search(params[:region])
    @events = @events.where("date ILIKE ?", "%#{date}%") if date
  end

  def create
    group = Group.find(params[:group_id])
    event = Event.find(params[:event_id])
    grouped_event_exist = GroupedEvent.where({ group: group, event: event })
    if grouped_event_exist[0]
      redirect_to group_grouped_events_path(group), notice: "Evento já tinha selecionado"
    else
      create_grouped_event(group, event)
    end
  end

  def votes
    @member = Member.where(user: current_user)
  end

  def add_vote
    vote_exist = Vote.where(group: params[:group_id], user: current_user)
    grouped_event = GroupedEvent.find(params[:grouped_event_id])
    if vote_exist[0].nil?
      create_vote(grouped_event)
      grouped_event.points += 1
      grouped_event.save
      redirect_to votes_group_grouped_events_path(params[:group_id]), notice: "Votado com sucesso!"
    else
      redirect_to votes_group_grouped_events_path(params[:group_id]), notice: "Não pode votar mais!"
    end
  end

  def result
    @grouped_events = GroupedEvent.where({ group_id: params[:group_id] }).order('points DESC').limit(1)
  end

  def cancel_vote
    vote = Vote.where(group: params[:group_id], user: current_user)
    if vote[0]
      Vote.destroy(vote[0].id)
      grouped_event = GroupedEvent.find(vote[0].grouped_event_id)
      grouped_event.points -= 1
      grouped_event.save
      redirect_to votes_group_grouped_events_path(params[:group_id]), notice: "Votação cancelada!"
    else
      redirect_to votes_group_grouped_events_path(params[:group_id]), notice: "Ainda não votou!"
    end
  end

  private

  def set_group_grouped_event
    @group = Group.find(params[:group_id])
    @grouped_events = GroupedEvent.where({ group_id: params[:group_id] })
  end

  def create_grouped_event(group, event)
    grouped_event = GroupedEvent.new
    grouped_event.group = group
    grouped_event.event = event
    if grouped_event.save
      redirect_to group_grouped_events_path(group), notice: "Evento adicionado com sucesso"
    else
      redirect_to group_grouped_events_path(group), notice: "Evento não adicionado"
    end
  end

  def create_vote(grouped_event)
    vote = Vote.new(group_id: params[:group_id])
    vote.user = current_user
    vote.grouped_event = grouped_event
    vote.save
  end
end
