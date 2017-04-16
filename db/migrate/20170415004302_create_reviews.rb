class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :place_id
      t.string :body
      t.integer :score
      t.references :user, foreign_key: true
    end
  end
end
