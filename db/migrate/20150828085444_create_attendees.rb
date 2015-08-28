class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.integer :identity, default: 1
      t.string :check_code, limit: 4
      t.integer :ticket_type
      t.string :name
      t.string :email
      t.string :org
      t.string :title
      t.string :github
      t.string :twitter
      t.timestamps null: false
    end
  end
end
