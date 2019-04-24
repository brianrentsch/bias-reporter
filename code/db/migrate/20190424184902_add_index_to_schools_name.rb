class AddIndexToSchoolsName < ActiveRecord::Migration[5.2]
  def change
    add_index :schools, :name, unique: true  #Ensure uniqueness by adding index to names
  end
end
