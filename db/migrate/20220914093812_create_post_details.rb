class CreatePostDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :post_details do |t|
      
      t.integer :post_id
      t.string :spot_name
      t.string :visit_time
      t.text :impre

      t.timestamps
    end
  end
end
