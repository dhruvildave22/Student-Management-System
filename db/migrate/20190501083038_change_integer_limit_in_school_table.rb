class ChangeIntegerLimitInSchoolTable < ActiveRecord::Migration[5.2]
  def change
    change_column :schools, :phone_no, :integer, limit: 8
  end
end
