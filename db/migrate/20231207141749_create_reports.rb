class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.bigint :reportable_id, polymorphic: true, null: false
      t.bigint :user_id, null: false, foreign_key: true
      t.text :reason

      t.timestamps
    end
  end
end
