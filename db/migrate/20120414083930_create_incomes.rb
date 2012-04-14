class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.date :date
      t.references :department, :null => false
      t.string :supplier

      t.timestamps
    end
    add_index :incomes, :department_id
  end
end
