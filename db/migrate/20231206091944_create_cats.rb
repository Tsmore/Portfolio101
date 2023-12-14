class CreateCats < ActiveRecord::Migration[6.1]
  def change
    create_table :cats do |t|
      t.string :name, null: false
      t.text :introduction
      t.date :date_of_birth
      t.integer :sex
      t.references :user, type: :bigint, foreign_key: true
      t.references :breed, type: :bigint, foreign_key: true

      t.timestamps
    end
  end
end
