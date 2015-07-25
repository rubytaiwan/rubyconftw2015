class AddDomIdToSpeakers < ActiveRecord::Migration
  def up
    add_column :speakers, :dom_id, :string, limit: 32
    Speaker.all.each{|s| s.dom_id = s.name.gsub(/\s/, '').underscore.dasherize;s.save;}
  end

  def down
    remove_column :speakers, :dom_id
  end
end
