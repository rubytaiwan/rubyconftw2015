class AddSlideUrlToSpeakers < ActiveRecord::Migration
  def change
  	add_column :speakers, :slide_url, :string
  end
end
