class AddDepartmentIdToIncomeItems < ActiveRecord::Migration
  def change
    add_column :income_items, :department_id, :integer
  end
end
