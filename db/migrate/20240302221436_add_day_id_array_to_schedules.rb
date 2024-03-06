class AddDayIdArrayToSchedules < ActiveRecord::Migration[7.1]
  def change
    add_column :schedules, :day_id_array, :integer
  end
end
