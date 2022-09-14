class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      
      t.integer :user_id
      t.string :title
      t.integer :location
      t.string :date
      t.boolean :status, default: true

      t.timestamps
    end
  end
end
