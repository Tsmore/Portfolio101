class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.references :post, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end

    add_index :tags, :name, unique: true
  end
end
