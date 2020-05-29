class ChangeUsers < ActiveRecord::Migration[6.0]
  def change
    add_index(:users, :email, unique: true, name: 'index_users_on_email')
    change_column :users, :email, :string, :default => '', :null => false
    change_column :users, :encrypted_password, :string, :default => '', :null => false
    change_column :users, :name, :string, :default => '', :null => false
    change_column :users, :bio, :text, :default => '', :null => false
  end
end
