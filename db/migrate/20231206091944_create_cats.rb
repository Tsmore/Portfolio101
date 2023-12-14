class CreateCats < ActiveRecord::Migration[6.1]
  def change
    create_table :cats do |t|
      t.string :name, null: false
      t.text :introduction
      t.date :date_of_birth
      t.integer :sex
      t.bigint :user_id, null: false, foreign_key: true
      t.bigint :breed_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
