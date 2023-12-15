class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.bigint :visitor_id, null: false
      t.bigint :visited_id, null: false
      t.bigint :post_id
      t.bigint :comment_id
      t.bigint :favorite_id
      t.bigint :relationship_id
      t.string :action, default: '', null: false
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
    add_index :notifications, :visitor_id
    add_index :notifications, :visited_id
    add_index :notifications, :post_id
    add_index :notifications, :comment_id
    add_index :notifications, :favorite_id
    add_index :notifications, :relationship_id
  end
end
