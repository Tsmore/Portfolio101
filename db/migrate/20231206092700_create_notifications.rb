class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.references :visitor, type: :bigint, null: false, foreign_key: { to_table: :users }
      t.references :visited, type: :bigint, null: false, foreign_key: { to_table: :users }
      t.references :relationship, type: :bigint, null: false, foreign_key: true
      t.references :comment, type: :bigint, null: false, foreign_key: true
      t.references :favorite, type: :bigint, null: false, foreign_key: true
      t.references :message, type: :bigint, null: false, foreign_key: true
      t.string :action, null: false
      t.boolean :is_read, null: false, default: false

      t.timestamps
    end
  end
end
