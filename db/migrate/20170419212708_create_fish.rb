class CreateFish < ActiveRecord::Migration[5.0]
  def change
    create_table :fish do |t|
      t.string :name
      t.string :breed
      t.string :temperament
      t.string :image_url
      t.string :description
      t.references :tank, foreign_key: true
    end
  end
end
