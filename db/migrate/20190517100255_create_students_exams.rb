class CreateStudentsExams < ActiveRecord::Migration[5.2]
  def change
    create_table :students_exams do |t|
      t.references :student, index: true, foreign_key: true
      t.references :exam, index: true, foreign_key: true
    end
  end
end
