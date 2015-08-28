namespace :dev do
  desc 'Sync production data to local'
  task sync_production: :environment do
    system "rsync -av -e ssh deploy@RUBY:/home/deploy/2015.rubyconf.tw/shared/public/uploads/ ./public/uploads/"
    system "ssh deploy@RUBY pg_dump rubyconftw2015_production -c -O | rails db"
  end
end
