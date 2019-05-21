class AddDateOfBirthAndJoinInStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :std_date_of_birth, :date
    add_column :students, :std_date_of_join, :date
  end
end
