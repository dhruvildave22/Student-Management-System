class Addteachertostudents < ActiveRecord::Migration[5.2]
  def change
    add_reference :students, :teacher, foreign_key: true
  end
end
