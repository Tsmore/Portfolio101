class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.references :reportable, type: :bigint, polymorphic: true, null: false
      t.references :user, type: :bigint, null: false, foreign_key: true
      t.text :reason

      t.timestamps
    end
  end
end
