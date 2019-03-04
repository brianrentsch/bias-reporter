class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.string :date
      t.string :time
      t.string :location
      t.text :details

      t.timestamps
    end
  end
end
