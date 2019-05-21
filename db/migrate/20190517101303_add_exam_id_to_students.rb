class AddExamIdToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :exam_id, :bigint
  end
end
