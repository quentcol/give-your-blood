class AppointmentPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def show?
    return user.donor.id == record.id || user.isadmin
  end

  def new?
    return create? || user.isadmin
  end

  def create?
    if user.category == 'donor' || user.isadmin
      return true
    else
      return false
    end
  end

end
