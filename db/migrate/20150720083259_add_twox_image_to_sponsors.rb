class AddTwoxImageToSponsors < ActiveRecord::Migration
  def change
    add_column :sponsors, :twox_image, :string
  end
end
