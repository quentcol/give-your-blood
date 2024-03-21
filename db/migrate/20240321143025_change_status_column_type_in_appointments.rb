class ChangeStatusColumnTypeInAppointments < ActiveRecord::Migration[7.1]
  def change
    change_column :appointments, :status, :integer, using: 'CASE WHEN status = \'pending\' THEN 0 WHEN status = \'in_progress\' THEN 1 WHEN status = \'completed\' THEN 2 END'
  end
end
