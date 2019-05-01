class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :std_name
      t.string :sd_father_name
      t.string :std_gender
      t.integer :std_date_of_birth
      t.string :std_address
      t.integer :std_date_of_join
      t.references :school, index: true, foreign_key: true

      t.timestamps
    end
  end
end
