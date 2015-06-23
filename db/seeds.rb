# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'highline/import'

if User.count < 1
  u = User.new
  u.email = ask("Please input admin's email：")
  u.name = ask("Please input admin's name：")
  u.password = ask("Please input password："){|q| q.echo = "*"}
  u.password_confirmation = ask("Please confirm password："){|q| q.echo = "*"}
  u.save!
end
SeedData = YAML.load(File.read('db/seed.yml'))
SeedData.each do |klassname, value_arrays|
  klass = klassname.to_s.classify.constantize
  value_arrays.each do |values|
    klass.create(values)
  end
end
