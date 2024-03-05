class CreateSchedules < ActiveRecord::Migration[7.1]
  def change
    create_table :schedules do |t|
      t.time :opening_time
      t.time :closing_time

      t.timestamps
    end
  end
end
