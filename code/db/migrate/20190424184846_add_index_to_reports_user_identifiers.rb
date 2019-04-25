class AddIndexToReportsUserIdentifiers < ActiveRecord::Migration[5.2]
  def change
    add_index :reports, :user_identifier, unique: true  #Ensure uniqueness by adding index to user IDs

  end
end
