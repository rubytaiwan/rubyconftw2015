class LinkEventToSpeakerSponsor < ActiveRecord::Migration
  def change
    add_column :conf_events, :resource_id, :integer
    add_column :conf_events, :resource_type, :string
  end
end
