class AddLevelToSponsors < ActiveRecord::Migration
  def change
    add_column :sponsors, :level, :integer
  end
end
