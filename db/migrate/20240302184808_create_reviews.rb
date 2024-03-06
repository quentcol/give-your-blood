class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.references :center, null: false, foreign_key: true
      t.references :doner, null: false, foreign_key: true
      t.float :rating
      t.text :review_content

      t.timestamps
    end
  end
end
