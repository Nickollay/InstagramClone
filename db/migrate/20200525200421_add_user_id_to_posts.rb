class AddUserIdToPosts < ActiveRecord::Migration[6.0]
  def change
    change_table :posts do |t|
      add_column :posts, :user_id, :integer

      add_foreign_key :posts, :users
    end
  end
end
