class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :profile_validation

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = Message.new(message_params)
    @message.user = current_user
    @message.conversation = @conversation
    if @message.save
      redirect_to Conversation.find(params[:conversation_id])
    else
      flash[:message_alert] = "Can not be blank"
      redirect_to Conversation.find(params[:conversation_id])
    end
  end

  def destroy

  end

  private

  def message_params
    params.require(:message).permit(:body,:image)
  end

  def profile_validation
    if !current_user.has_profile?
      redirect_to new_profile_path
      flash[:notice] = "Please enter your details to continue"
    end
  end

end
