class RemoveTeacherableIdFromTeacher < ActiveRecord::Migration[5.2]
  def change
    remove_column :teachers, :teacherable_id
  end
end
