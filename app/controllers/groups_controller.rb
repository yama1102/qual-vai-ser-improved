class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @message = Message.new
  end

  def new
    @group = Group.new
    @users = User.all
  end

  def create
    group = Group.new(group_params)
    group.user = current_user
    members_id = params[:group][:members]
    Member.create!(user: current_user, group: group)
    if group.save
      create_members(members_id, group)
      redirect_to group_path(group)
    else
      render :new
    end
  end

  def destroy
    if @group.user == current_user
      @group.destroy
      redirect_to groups_path, notice: 'Group was successfully destroyed.'
    end
  end

  def close
    group = Group.find(params[:id])
    group.close = true
    group.save
    redirect_to result_group_grouped_events_path(group)
  end

  private

  def group_params
    params.require('group').permit(:name, :members)
  end

  def create_members(members_id, group)
    members_id.each do |user_id|
      unless user_id.empty?
        user = User.find(user_id)
        Member.create!(user: user, group: group)
      end
    end
  end
end
