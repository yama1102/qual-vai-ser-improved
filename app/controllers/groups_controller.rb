class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user
    raise
    Member.create!(user: current_user, group: @group)
    Member.create!(user: params, group: @group)
    if @group.save
      redirect_to groups_path(@groups) #futuramente preciso mudar esse path para o chatroom
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

  private
  def group_params
    params.require(:group).permit(:name)
  end
end
