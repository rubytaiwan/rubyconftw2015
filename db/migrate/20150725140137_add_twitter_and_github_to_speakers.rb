class AddTwitterAndGithubToSpeakers < ActiveRecord::Migration
  def change
    add_column :speakers, :twitter, :string, limit: 64
    add_column :speakers, :github, :string, limit: 64
    add_column :speakers, :home_page, :string
  end
end
