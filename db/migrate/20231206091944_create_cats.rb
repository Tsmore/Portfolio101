class CreateCats < ActiveRecord::Migration[6.1]
  def change
    create_table :cats do |t|
      t.integer :breed_id
      t.string :name
      t.text :introduction
      t.date :date_of_birth
      t.integer :sex

      t.timestamps
    end
  end
end
