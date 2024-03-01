class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.date :date
      t.string :person_in_charge
      t.references :patient, null: false, foreign_key: true
      t.references :center, null: false, foreign_key: true

      t.timestamps
    end
  end
end
