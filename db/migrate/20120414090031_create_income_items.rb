class CreateIncomeItems < ActiveRecord::Migration
  def change
    create_table :income_items do |t|
      t.references :income, :null => false
      t.references :product, :null => false
      t.integer :amount, :null => false
      t.decimal :price, :null => false

      t.timestamps
    end
    add_index :income_items, :income_id
    add_index :income_items, :product_id
  end
end
