class AddTimeAndDateToReviews < ActiveRecord::Migration[7.1]
  def change
    add_column :reviews, :start_time, :datetime
  end
end
