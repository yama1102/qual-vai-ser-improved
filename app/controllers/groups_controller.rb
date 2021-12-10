class GroupsController < ApplicationController
  def index
    @groups = Group.where(user: current_user)
    @group = Group.new
  end

  def show
    @group = Group.find(params[:id])
    @message = Message.new
    @member = Member.new
    @friends = get_user_friends
  end

  def get_user_friends
    friends = Set.new
    Friendship.where("user_id = ? OR friend_id = ?", current_user.id, current_user.id).each do |friendship|
      friends << friendship.user unless friendship.user == current_user
      friends << friendship.friend unless friendship.friend == current_user
    end
    friends
  end

  def new
    @group = Group.new
    @users = User.all
  end

  def create
    group = Group.new(group_params)
    group.user = current_user
    if group.save
      Member.create!(user: current_user, group: group, adm: true)
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
end
