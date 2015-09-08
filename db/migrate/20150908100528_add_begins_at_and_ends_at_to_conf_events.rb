class AddBeginsAtAndEndsAtToConfEvents < ActiveRecord::Migration
  def change
    add_column :conf_events, :begins_at, :timestamp
    add_column :conf_events, :ends_at, :timestamp
  end
end
