class AddForeignKeySpecialtytwo < ActiveRecord::Migration[5.0]
  def change
      add_reference :complaints, :specialty, foreign_key: true
  end
end
