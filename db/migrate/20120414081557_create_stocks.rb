class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.references :department
      t.references :product
      t.integer :amount, :null => false, :default => 0

      t.timestamps
    end
  end
end
