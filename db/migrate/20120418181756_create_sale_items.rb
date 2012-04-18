class CreateSaleItems < ActiveRecord::Migration
  def change
    create_table :sale_items do |t|
      t.references :sale_order
      t.references :department
      t.references :product
      t.integer :amount
      t.decimal :price
      t.decimal :sum

      t.timestamps
    end
    add_index :sale_items, :sale_order_id
    add_index :sale_items, :department_id
    add_index :sale_items, :product_id
  end
end
