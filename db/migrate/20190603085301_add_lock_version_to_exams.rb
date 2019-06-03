class AddLockVersionToExams < ActiveRecord::Migration[5.2]
  def change
    add_column :exams, :lock_version, :integer, default: 0, null: false
  end
end
