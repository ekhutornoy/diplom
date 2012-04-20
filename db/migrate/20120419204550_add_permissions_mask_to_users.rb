class AddPermissionsMaskToUsers < ActiveRecord::Migration
  def change
    add_column :users, :permissions_mask, :integer
  end
end
