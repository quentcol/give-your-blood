class SchedulePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def new?
    user.present?
  end

  def show?
    true
  end

  def create?
    user_hospital_owner? && record.center.hospital == user.hospital
  end

  def update?
    user_hospital_owner?
  end

  def destroy?
    user_hospital_owner?
    user.hospital.centers.include?(record.center)
  end

  private

  def user_hospital_owner?
    user.hospital.present? && record.center.present? && user.hospital.id == record.center.hospital_id
  end
end
