class MessagesController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @message = Message.new(message_params)
    @message.group = @group
    @message.user = current_user
    if @message.save
      GroupChannel.broadcast_to(
        @group,
        render_to_string(partial: "groups/message", locals: { message: @message })
      )
      redirect_to group_path(@group, anchor: "message-#{@message.id}")
    else
      render "groups/show"
    end
  end

  private

  def message_params
    params.require('message').permit(:content)
  end
end
