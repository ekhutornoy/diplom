class CreateSaleOrders < ActiveRecord::Migration
  def change
    create_table :sale_orders do |t|
      t.date :date
      t.string :client

      t.timestamps
    end
  end
end
