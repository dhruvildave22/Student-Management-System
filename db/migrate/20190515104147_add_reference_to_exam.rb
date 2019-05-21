class AddReferenceToExam < ActiveRecord::Migration[5.2]
  def change
    add_reference :exams, :student, foreign_key: true
  end
end
