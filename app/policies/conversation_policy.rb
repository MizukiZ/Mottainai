class ConversationPolicy < ApplicationPolicy

  def show?
    user == record.user1 || user == record.user2
  end

end
