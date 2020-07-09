class AddAdminToUsers < ActiveRecord::Migration[6.0]
  def up
    rename_column :users, :string, :admin
    change_column :users, :admin, default: false
    User.(admin: false)
  end

  def down
    remove_column :users, :admin
  end
end
