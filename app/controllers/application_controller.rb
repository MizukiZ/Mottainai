class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception
  before_action :header

  def after_sign_in_path_for(resource)
    if !current_user.profile.present?
      new_profile_path
    else
      items_path
    end
  end

  def after_sign_out_path_for(resource)
      items_path
  end

# message notification
  def header
    as_user1 = Conversation.where(user1: current_user)
    as_user2 = Conversation.where(user2: current_user)
    conversations = as_user1 | as_user2
    @notification = false

    conversations.each do |conversation|

      if conversation.messages.where.not(user_id: current_user.id).last.present?
        if  conversation.messages.where.not(user_id: current_user.id).last.read == false
          return @notification = true
        end
      end
    end

  end

end
