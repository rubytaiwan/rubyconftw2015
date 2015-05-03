class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.string :name
      t.string :avatar
      t.string :biography
      t.string :subject
      t.text :abstract

      t.timestamps null: false
    end
  end
end
