class RemoveDayIdArrayFromSchedules < ActiveRecord::Migration[7.1]
  def change
    remove_column :schedules, :day_id_array, :integer
  end
end
