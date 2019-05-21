class CreateExamStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :exam_students do |t|
      t.integer :exam_id
      t.integer :student_id
      t.timestamps
    end
  end
end
