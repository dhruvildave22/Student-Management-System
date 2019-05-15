class AddIndexToTeachers < ActiveRecord::Migration[5.2]
  def change
    add_index :teachers, [:teacherable_type, :teacherable_id]
  end
end
