class AddComments < ActiveRecord::Migration[6.0]
  create_table :comments do |t|
    t.text :content
    t.references :post, foreign_key: true

    t.timestamps
  end
end
