class AddTeacherableIdToTeacher < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :teacherable_id, :integer
  end
end
