class AddForeignKeySpecialty < ActiveRecord::Migration[5.0]
  def change
      add_reference :doctors, :specialty, foreign_key: true
  end
end
