class AddTitleToSpeakers < ActiveRecord::Migration
  def change
    add_column :speakers, :title, :string
    execute "UPDATE speakers SET title = biography;"
  end
end
