class RemoveDateOfBirthFromStudent < ActiveRecord::Migration[5.2]
  def change
    remove_column :students, :std_date_of_birth
  end
end
