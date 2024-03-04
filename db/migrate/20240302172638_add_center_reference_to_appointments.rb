class AddCenterReferenceToAppointments < ActiveRecord::Migration[7.1]
  def change
    add_reference :appointments, :center, null: false, foreign_key: true
  end
end
