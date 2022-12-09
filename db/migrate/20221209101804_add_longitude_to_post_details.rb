class AddLongitudeToPostDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :post_details, :longitude, :float
  end
end
