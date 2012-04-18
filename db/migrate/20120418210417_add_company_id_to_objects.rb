class AddCompanyIdToObjects < ActiveRecord::Migration
  def change
    add_column :categories, :company_id, :integer
    add_column :departments, :company_id, :integer
    add_column :incomes, :company_id, :integer
    add_column :income_items, :company_id, :integer
    add_column :products, :company_id, :integer
    add_column :sale_orders, :company_id, :integer
    add_column :sale_items, :company_id, :integer
    add_column :stocks, :company_id, :integer

    add_index :categories, :company_id
    add_index :departments, :company_id
    add_index :incomes, :company_id
    add_index :income_items, :company_id
    add_index :products, :company_id
    add_index :sale_orders, :company_id
    add_index :sale_items, :company_id
    add_index :stocks, :company_id
  end
end
