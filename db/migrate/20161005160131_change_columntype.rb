class ChangeColumntype < ActiveRecord::Migration[5.0]
  def change
    change_column :appointments, :date, :text
  end
end
