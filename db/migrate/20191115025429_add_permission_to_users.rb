class AddPermissionToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :permission, :integer, :default => 0
    add_index :users, :permission
  end
end
