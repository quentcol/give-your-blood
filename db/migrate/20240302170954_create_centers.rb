class CreateCenters < ActiveRecord::Migration[7.1]
  def change
    create_table :centers do |t|
      t.string :address
      t.references :hospital, null: false, foreign_key: true

      t.timestamps
    end
  end
end
