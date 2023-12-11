class CreateCats < ActiveRecord::Migration[6.1]
  def change
    create_table :cats do |t|
      t.references :breed, null: false, foreign_key: true
      t.string :name, null: false
      t.text :introduction
      t.date :date_of_birth
      t.integer :sex
      t.integer :user_id

      t.timestamps
    end
    add_index :cats, :user_id
  end
end
