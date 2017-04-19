class AddImageToTank < ActiveRecord::Migration[5.0]
  def change
    add_column :tanks, :image_url, :string
  end
end
