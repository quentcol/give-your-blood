class CreateCenters < ActiveRecord::Migration[7.1]
  def change
    create_table :centers do |t|
      t.string :address

      t.timestamps
    end
  end
end
