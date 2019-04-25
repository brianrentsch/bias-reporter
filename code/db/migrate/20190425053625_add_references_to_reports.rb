class AddReferencesToReports < ActiveRecord::Migration[5.2]
  def change
    add_reference :reports, :school, foreign_key: true
  end
end
