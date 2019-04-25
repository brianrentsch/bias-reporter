class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.string :user_identifier
      t.date :date
      t.string :time
      t.string :location
      t.text :details
      t.string :status
      
      t.timestamps
    end
  end
end
