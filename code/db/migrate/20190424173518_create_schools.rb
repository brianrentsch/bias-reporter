class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code

      t.timestamps
    end
  end
end
