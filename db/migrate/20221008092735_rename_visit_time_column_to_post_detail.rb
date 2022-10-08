class RenameVisitTimeColumnToPostDetail < ActiveRecord::Migration[6.1]
  def change
    change_column :post_details, :visit_time, :datetime
  end
end
