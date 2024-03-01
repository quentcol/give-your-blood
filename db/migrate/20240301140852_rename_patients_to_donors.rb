class RenamePatientsToDonors < ActiveRecord::Migration[7.1]
  def change
    rename_table :patients, :donors
  end
end
