class CreateWaterParameters < ActiveRecord::Migration[5.0]
  def change
    create_table :water_parameters do |t|
      t.float :ph
      t.float :ammonia
      t.float :nitrate
      t.float :nitrite
      t.integer :water_change
      
      t.timestamps null: false
      t.references :tank, foreign_key: true
    end
  end
end
