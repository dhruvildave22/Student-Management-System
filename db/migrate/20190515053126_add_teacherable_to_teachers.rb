class AddTeacherableToTeachers < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :teacherable_id, :integer
    add_column :teachers, :teacherable_type, :string

  end
end
