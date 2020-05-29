class Users < ActiveRecord::Migration[6.0]
  # def change
  #   change_column :users, :email, :string, unique: true
  # end
  create_table :users, force: :cascade do |t|
    t.string :email, :string, unique: true
    t.string :encrypted_password, default: "", null: false
    t.datetime :created_at, precision: 6, null: false
    t.datetime :updated_at, precision: 6, null: false
  end
end
