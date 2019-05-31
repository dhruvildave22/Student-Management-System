class RemoveTeacherableFromTeachers < ActiveRecord::Migration[5.2]
  def change
    remove_column :teachers, :teacherable_id
    remove_column :teachers, :teacherable_type
  end
end
