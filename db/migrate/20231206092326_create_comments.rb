class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :user, type: :bigint, null: false, foreign_key: true
      t.references :post, type: :bigint, null: false, foreign_key: true
      t.text :body, null: false

      t.timestamps
    end
  end
end
