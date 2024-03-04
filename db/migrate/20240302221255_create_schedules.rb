class CreateSchedules < ActiveRecord::Migration[7.1]
  def change
    create_table :schedules do |t|
      t.time :opening_time
      t.time :closing_time
      t.references :center, null: false, foreign_key: true

      t.timestamps
    end
  end
end
