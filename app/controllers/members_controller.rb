class MembersController < ApplicationController

  def create
    group = Group.find(params[:group_id])
    member = Member.new(member_params)
    member.group = group
    member.save
    redirect_to group
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to @member.group
  end

  def member_params
    params.require(:member).permit(:user_id)
  end
end
