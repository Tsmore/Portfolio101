class CreateBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarks do |t|
      t.bigint :user_id, null: false, foreign_key: true
      t.bigint :post_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
