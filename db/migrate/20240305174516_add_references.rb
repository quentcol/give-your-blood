class AddReferences < ActiveRecord::Migration[7.1]
  def change
    add_reference(:schedules, :center, foreign_key: true)
    add_reference(:appointments, :center, foreign_key: true)
  end
end
