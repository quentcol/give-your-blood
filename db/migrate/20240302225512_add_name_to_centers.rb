class AddNameToCenters < ActiveRecord::Migration[7.1]
  def change
    add_column :centers, :name, :string
  end
end
