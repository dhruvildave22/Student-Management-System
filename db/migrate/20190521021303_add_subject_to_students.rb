class AddSubjectToStudents < ActiveRecord::Migration[5.2]
  def change
    add_reference :students, :subject, foreign_key: true
  end
end
