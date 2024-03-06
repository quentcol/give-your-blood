class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.date :appointment_date
      t.time :appointment_time
      t.string :person_in_charge
      t.references :donor, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
