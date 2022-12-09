class AddLatitudeToPostDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :post_details, :latitude, :float
  end
end
