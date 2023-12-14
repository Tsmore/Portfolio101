class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.bigint :follower_id, null: false, foreign_key: { to_table: :users }
      t.bigint :following_id, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
