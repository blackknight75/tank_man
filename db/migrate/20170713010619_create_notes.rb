class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.string :body
      t.timestamps null: false
      t.references :fish, foreign_key: true
    end
  end
end
