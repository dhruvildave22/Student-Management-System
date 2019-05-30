class AddTeacherCodeToTeachers < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :teacher_code, :integer
  end
end
