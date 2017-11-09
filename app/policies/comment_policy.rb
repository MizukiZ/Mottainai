class CommentPolicy < ApplicationPolicy

  def destroy?
    user == record.commenter
  end

end
