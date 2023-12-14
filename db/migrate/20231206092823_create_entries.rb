class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.references :user, type: :bigint, null: false, foreign_key: true
      t.references :room, type: :bigint, null: false, foreign_key: true

      t.timestamps
    end
  end
end
