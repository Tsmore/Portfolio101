class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.bigint :user_id, null: false, foreign_key: true
      t.bigint :post_id, null: false, foreign_key: true
      t.text :body, null: false

      t.timestamps
    end
  end
end
