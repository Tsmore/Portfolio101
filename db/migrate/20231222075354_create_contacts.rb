class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :title
      t.text :body
      t.string :email
      t.string :name
      t.integer :user_id
      t.boolean :is_checked, default: false

      t.timestamps
    end
  end
end
