class AppointmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.category == 'donor'
        scope.where(donor_id: user.donor.id)
      else
        scope.none # Return no records if user is not a donor
      end
    end
  end

  def show?
    return user.donor == record.donor
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

  def cancel?
    true
  end

  def approve?
    true
  end

  def deny?
    true
  end

  def edit?
    user.donor == record.donor
  end

  def update?
    user.donor == record.donor
  end

  def cancel?
    user.present? && user.donor == record.donor
  end

  def destroy?
    @record.donor == user.donor
  end
end
