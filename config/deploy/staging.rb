set :default_env, { path: "/usr/local/ruby22/bin:$PATH" }
set :branch, ENV['REVISION'] || 'develop'
set :stage, :staging
set :deploy_to, '/home/deploy/stg.2015.rubyconf.tw'
role :web, "deploy@rubytw2.cloudapp.net"
role :app, "deploy@rubytw2.cloudapp.net"
role :db,  "deploy@rubytw2.cloudapp.net", :primary => true
