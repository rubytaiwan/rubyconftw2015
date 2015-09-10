class CreateConfActivities < ActiveRecord::Migration
  def change
    create_table :conf_activities do |t|
      t.integer :attendee_id
      t.integer :event_id
      t.timestamp :happened_at
      t.timestamps null: false
    end
  end
end
