namespace :dev do
  desc 'Sync production data to local'
  task sync_production: :environment do
    system "rsync -av -e ssh deploy@RUBY:/home/deploy/2015.rubyconf.tw/shared/public/uploads/ ./public/uploads/"
    system "ssh deploy@RUBY pg_dump rubyconftw2015_production -c -O | rails db"
  end

  desc 'Import KKTIX exported CSV'
  task import_kktix_csv: :environment do
    fp = File.expand_path(ENV['CSV_PATH'])
    res = ::Conf::Attendee.import_from_csv(fp)
    puts "新建 #{res.size} 筆報名者資料"
  end

  desc 'Fetch Codeme.cc JSON'
  task fetch_codemecc_json: :environment do
    after_id = Conf::Activity.maximum(:id)
    ress = Conf::Activity.fetch_codemecc_json(after_id: after_id)
    puts "截取到 #{ress.size} 筆新活動資料"
  end
end
