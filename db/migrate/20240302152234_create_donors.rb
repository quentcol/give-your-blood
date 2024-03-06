class CreateDonors < ActiveRecord::Migration[7.1]
  def change
    create_table :donors do |t|
      t.references :user, foreign_key: true
      t.string :address
      t.string :blood_type
      t.date :birthdate
      t.string :first_name
      t.string :last_name
      t.string :national_id
      t.timestamps
    end
  end
end
