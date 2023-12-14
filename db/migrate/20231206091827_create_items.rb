class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.text :product_link
      t.bigint :user_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
