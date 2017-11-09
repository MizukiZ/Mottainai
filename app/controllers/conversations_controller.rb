class ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :profile_validation, except: [:index]
  before_action :set_converstion, except: [:index,:create]

  # kaminari
  PER = 5

  def index
    as_user1 = Conversation.where(user1: current_user)
    as_user2 = Conversation.where(user2: current_user)

    @conversations = as_user1 | as_user2
    @conversations.sort! { |a,b| b.updated_at <=> a.updated_at }

    @pagenate_conversations = Kaminari.paginate_array(@conversations).page(params[:page]).per(PER)
  end

  def show
    @messages = @conversation.messages
    @last_message = @messages.last
    @new_message = Message.new
    @over_ten = false

    if @messages.count > 10
      @messages = @messages[-9..-1]
      @over_ten = true
      @view_all = false

      if params[:view] == "all"
        @messages = @conversation.messages
        @view_all = true
      elsif params[:view] == 'ten'
        @messages = @messages[-9..-1]
        @view_all = false
      end

    end

    return if !@last_message.present?
    if current_user != @last_message.user && @last_message
      @last_message.read = true
      @last_message.save
    end
  end

  def create
    @conversation = Conversation.new(conversation_params)
    @conversation.user1_id = current_user.id
    @conversation.save
    redirect_to @conversation
  end

  def update
  end

  def destroy
  end

  private

  def conversation_params
    params.permit(:user2_id)
  end

  def set_converstion
    @conversation = Conversation.find(params[:id])
  end

  def profile_validation
    if !current_user.has_profile?
      redirect_to new_profile_path
      flash[:notice] = "Please enter your details to continue"
    end
  end

end
