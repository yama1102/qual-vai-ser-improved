class GroupsController < ApplicationController

  def show
  end

  def new
    @group = Group.new
    @users = User.all
  end

  def create
    group = Group.new(group_params)
    group.user = current_user
    if group.save
      redirect_to group_path(group)
    else
      render :new
    end
  end

  private

  def group_params
    params.require('group').permit(:name)
  end
end
