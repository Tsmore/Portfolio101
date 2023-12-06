class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :visitor_id
      t.integer :visited_id
      t.integer :relationship_id
      t.integer :comment_id
      t.integer :favorite_id
      t.integer :message_id
      t.string :action, null: false
      t.boolean :is_read, null: false, default: false

      t.timestamps
    end
  end
end
