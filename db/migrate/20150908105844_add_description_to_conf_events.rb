class AddDescriptionToConfEvents < ActiveRecord::Migration
  def change
    add_column :conf_events, :description, :text
  end
end
