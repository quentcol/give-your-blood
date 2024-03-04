class AddDayIdToSchedules < ActiveRecord::Migration[7.1]
  def change
    add_reference :schedules, :day, null: false, foreign_key: true
  end
end
