class ChangeDateofjoiningIntoDate < ActiveRecord::Migration[5.2]
  def change
    remove_column :students, :std_date_of_join
  end
end
