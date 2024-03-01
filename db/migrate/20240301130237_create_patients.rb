class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :address
      t.string :blood_type
      t.date :birthdate
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
