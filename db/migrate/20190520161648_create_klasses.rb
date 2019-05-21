class CreateKlasses < ActiveRecord::Migration[5.2]
  def change
    create_table :klasses do |t|
      t.string :subject
      t.references :student
      t.references :teacher

      t.timestamps
    end
  end
end
