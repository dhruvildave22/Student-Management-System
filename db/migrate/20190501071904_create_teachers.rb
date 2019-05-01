class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :t_name
      t.string :father_name
      t.string :gender
      t.integer :date_of_birth
      t.string :t_address
      t.integer :date_of_join
      t.references :school, index: true, foreign_key: true

      t.timestamps
    end
  end
end
