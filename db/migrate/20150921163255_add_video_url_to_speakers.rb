class AddVideoUrlToSpeakers < ActiveRecord::Migration
  def change
  	add_column :speakers, :video_url, :string
  end
end
