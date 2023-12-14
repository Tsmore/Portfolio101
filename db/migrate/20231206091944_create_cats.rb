class CreateCats < ActiveRecord::Migration[6.1]
  def change
    create_table :cats do |t|
      t.string :name, null: false
      t.text :introduction
      t.date :date_of_birth
      t.integer :sex
      t.references :user, foreign_key: true
      t.references :breed, foreign_key: true

      t.timestamps
    end
  end
end
