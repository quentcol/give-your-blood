class CenterPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end

  end

  def show?
    true
  end

  def new?
    return create?
  end

  def create?
    if user.category == 'hospital'
      return true
    else
      return false
    end
  end

  def edit?
    return update?
  end

  def update?
    user.hospitals.exists?(id: record.hospital_id)
  end
end
