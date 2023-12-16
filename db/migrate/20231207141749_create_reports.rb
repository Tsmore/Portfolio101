class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.references :reportable, polymorphic: true, null: false
      t.bigint :user_id, null: false, foreign_key: true
      t.boolean :processed, default: false
      t.text :reason

      t.timestamps
    end
  end
end
