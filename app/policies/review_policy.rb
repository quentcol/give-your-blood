class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def index?
    true
  end

  def new?
    return create?
  end

  def create?
    if user.category == 'donor'
      return true
    else
      return false
    end
  end

  def destroy?
    user == record.donor
  end

  def update?
    false
  end
end
