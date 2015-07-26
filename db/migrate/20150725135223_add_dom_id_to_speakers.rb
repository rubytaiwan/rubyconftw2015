class AddDomIdToSpeakers < ActiveRecord::Migration
  def up
    add_column :speakers, :dom_id, :string, limit: 32
  end

  def down
    remove_column :speakers, :dom_id
  end
end
