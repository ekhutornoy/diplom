class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.integer :department_id
      t.integer :product_id
      t.integer :amount

      t.timestamps
    end
  end
end
