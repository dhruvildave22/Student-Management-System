class CreateExams < ActiveRecord::Migration[5.2]
  def change
    create_table :exams do |t|
      t.string :exam_name
      t.integer :exam_duration
    end
  end
end
