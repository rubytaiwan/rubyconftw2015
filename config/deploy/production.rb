set :default_env, { path: "/usr/local/ruby22/bin:$PATH" }
set :branch, "master"
set :stage, :production
set :deploy_to, '/home/deploy/2015.rubyconf.tw'
role :web, "deploy@rubytw2.cloudapp.net"
role :app, "deploy@rubytw2.cloudapp.net"
role :db,  "deploy@rubytw2.cloudapp.net", :primary => true
