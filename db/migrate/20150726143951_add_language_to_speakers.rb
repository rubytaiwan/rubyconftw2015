class AddLanguageToSpeakers < ActiveRecord::Migration
  def change
    add_column :speakers, :english, :boolean, default: true
  end
end
