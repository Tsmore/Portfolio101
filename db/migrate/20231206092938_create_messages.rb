class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.bigint :user_id, null: false, foreign_key: true
      t.bigint :room_id, null: false, foreign_key: true
      t.text :message, null: false

      t.timestamps
    end
  end
end
