class AddPasswordDigestToSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :password_digest, :string
  end
end
