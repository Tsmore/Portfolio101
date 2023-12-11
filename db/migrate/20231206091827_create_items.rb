class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.text :product_link
      t.integer :user_id

      t.timestamps
    end
    add_index :items, :user_id
  end
end
