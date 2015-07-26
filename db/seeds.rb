require 'highline/import'
require 'csv'

if User.count < 1
  u = User.new
  u.email = ask("Please input admin's email：")
  u.name = ask("Please input admin's name：")
  u.password = ask("Please input password："){|q| q.echo = "*"}
  u.password_confirmation = ask("Please confirm password："){|q| q.echo = "*"}
  u.save!
end


ActiveRecord::Base.transaction do
  begin
    Speaker.delete_all if ENV['DELETE_BEFORE_CREATE'].to_i == 1
    CSV.open('db/speakers.csv', headers:true).each do |csvrow|
      h = csvrow.to_hash.symbolize_keys
      spk = Speaker.new(h)
      fn = File.join(Rails.root, "public/fixtures/speakers/#{spk.dom_id}.png")
      spk.avatar = open(fn) if File.exists?(fn)
      spk.save!
    end
  #rescue
  #  puts "建立 Speaker 失敗"
  end
end
