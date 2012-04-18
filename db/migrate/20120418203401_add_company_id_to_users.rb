class AddCompanyIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :company_id, :integer
    add_column :users, :admin, :boolean, :null => false, :default => false
  end
end
