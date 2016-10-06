class ChangeColumnPatients < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :first_name, :string
    add_column :patients, :family_name, :string
  end
end
