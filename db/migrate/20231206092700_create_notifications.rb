class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :visitor_id
      t.integer :visited_id
      t.integer :relationship_id
      t.integer :comment_id
      t.integer :favorite_id
      t.integer :message_id
      t.string :action
      t.boolean :is_read

      t.timestamps
    end
  end
end
