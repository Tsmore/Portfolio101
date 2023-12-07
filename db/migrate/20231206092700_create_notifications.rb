class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.references :visitor, null: false, foreign_key: { to_table: :users }
      t.references :visited, null: false, foreign_key: { to_table: :users }
      t.references :relationship, null: false, foreign_key: true
      t.references :comment, null: false, foreign_key: true
      t.references :favorite, null: false, foreign_key: true
      t.references :message, null: false, foreign_key: true
      t.string :action, null: false
      t.boolean :is_read, null: false, default: false

      t.timestamps
    end
  end
end
