class DonorPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def show?
    return user.donor.id = record.id
  end

  def new?
    return create?
  end

  def create?
    if user.category == 'donor' || user.isadmin
      return true
    else
      return false
    end
  end

  def edit?
    return update?
  end

  def update?
    user.donor == record || user.isadmin
  end
end
