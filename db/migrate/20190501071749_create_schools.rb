class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.string :s_name
      t.string :s_address
      t.integer :phone_no

      t.timestamps
    end
  end
end
