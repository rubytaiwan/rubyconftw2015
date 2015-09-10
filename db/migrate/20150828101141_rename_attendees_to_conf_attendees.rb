class RenameAttendeesToConfAttendees < ActiveRecord::Migration
  def change
    rename_table :attendees, :conf_attendees
  end
end
