class CreateSubjectType < ActiveRecord::Migration[5.2]
  def change
    create_table :subject_types do |t|
      t.references :teacher, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true
    end
  end
end
