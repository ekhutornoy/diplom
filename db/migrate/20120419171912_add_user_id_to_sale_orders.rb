class AddUserIdToSaleOrders < ActiveRecord::Migration
  def change
    add_column :sale_orders, :user_id, :integer
  end
end
