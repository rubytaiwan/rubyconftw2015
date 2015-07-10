class AddSortOrderToSpeakers < ActiveRecord::Migration
  def change
    add_column :speakers, :sort_order, :integer
  end
end
