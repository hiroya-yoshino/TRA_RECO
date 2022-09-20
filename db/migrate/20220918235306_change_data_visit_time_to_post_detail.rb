class ChangeDataVisitTimeToPostDetail < ActiveRecord::Migration[6.1]
  def change
    change_column :post_details, :visit_time, :time
  end
end
