class MembersController < ApplicationController
  def create
    group = Group.find(params[:group_id])
    user_member = User.find(member_params[:user_id])
    member_exist = Member.where({ group: group, user: user_member })
    if member_exist[0].nil?
      member_addition_in_group(group)
      redirect_to group
    else
      redirect_to group, alert: "Membro já existe no grupo"
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to @member.group
  end

  private

  def member_params
    params.require(:member).permit(:user_id)
  end

  def member_addition_in_group(group)
    member = Member.new(member_params)
    member.group = group
    member.save
  end
end
