class HospitalPolicy < ApplicationPolicy
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
    user.category == 'hospital'
  end

  def edit?
    return update?
  end

  def update?
    record.hospital_id == user.hospital.id
  end
end
