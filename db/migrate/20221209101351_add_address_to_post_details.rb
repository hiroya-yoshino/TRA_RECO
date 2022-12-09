class AddAddressToPostDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :post_details, :address, :string
  end
end
