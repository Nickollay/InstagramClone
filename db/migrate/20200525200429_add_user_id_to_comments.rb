class AddUserIdToComments < ActiveRecord::Migration[6.0]
  def change
    change_table :comments do |t|
      add_column :comments, :user_id, :integer

      add_foreign_key :comments, :users
    end
  end
end
