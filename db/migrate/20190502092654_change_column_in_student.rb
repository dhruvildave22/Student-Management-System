class ChangeColumnInStudent < ActiveRecord::Migration[5.2]
  def change
    rename_column :students, :sd_father_name, :std_father_name
  end
end
