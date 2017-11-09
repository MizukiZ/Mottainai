class ProfilePolicy < ApplicationPolicy

  def new?
    !user.has_profile?
  end

  def update?
    user == record.user
  end

end
