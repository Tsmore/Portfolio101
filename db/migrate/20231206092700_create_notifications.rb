class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.bigint :visitor_id, null: false, foreign_key: { to_table: :users }
      t.bigint :visited_id, null: false, foreign_key: { to_table: :users }
      t.bigint :relationship_id, null: false, foreign_key: true
      t.bigint :comment_id, null: false, foreign_key: true
      t.bigint :favorite_id, null: false, foreign_key: true
      t.bigint :message_id, null: false, foreign_key: true
      t.string :action, null: false
      t.boolean :is_read, null: false, default: false

      t.timestamps
    end
  end
end
