class CreateConfEvents < ActiveRecord::Migration
  def change
    create_table :conf_events do |t|
      t.string :name
      t.string :category
      t.string :slug
      t.timestamps null: false
    end
  end
end
