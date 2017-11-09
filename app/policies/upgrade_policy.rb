class UpgradePolicy < ApplicationPolicy

  def create?
    !user.profile.premium?
  end

end
