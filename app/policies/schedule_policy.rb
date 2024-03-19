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
    user_hospital_owner? || user.isadmin
  end

  def update?
    user_hospital_owner? || user.isadmin
  end

  def destroy?
    user_hospital_owner? || user.isadmin
  end

  private

  def user_hospital_owner?
    user.hospitals.exists?(id: record.center.hospital_id) || user.isadmin
  end
end
