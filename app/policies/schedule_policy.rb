class SchedulePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    user_hospital_owner?
  end

  def update?
    user_hospital_owner?
  end

  def destroy?
    user_hospital_owner?
  end

  private

  def user_hospital_owner?
    user.hospitals.exists?(id: record.center.hospital_id)
  end
end
