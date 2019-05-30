class AddStduentCodeToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :student_code, :integer
  end
end
