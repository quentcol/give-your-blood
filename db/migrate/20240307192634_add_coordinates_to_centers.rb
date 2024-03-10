class AddCoordinatesToCenters < ActiveRecord::Migration[7.1]
  def change
    add_column :centers, :latitude, :float
    add_column :centers, :longitude, :float
  end
end
