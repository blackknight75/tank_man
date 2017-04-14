class CreateTanks < ActiveRecord::Migration[5.0]
  def change
    create_table :tanks do |t|
      t.string :name
      t.integer :size
      t.string :style
      t.string :description
      t.references :user, foreign_key: true
    end
  end
end
