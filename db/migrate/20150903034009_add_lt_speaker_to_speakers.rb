class AddLtSpeakerToSpeakers < ActiveRecord::Migration
  def change
  	add_column :speakers, :lt_speaker, :boolean 
  end
end
