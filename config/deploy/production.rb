set :default_env, { path: "/usr/local/ruby22/bin:$PATH" }
set :branch, ENV['REVISION'] || "master"
set :stage, :production
role :web, "deploy@rubytw2.cloudapp.net"
role :app, "deploy@rubytw2.cloudapp.net"
role :db,  "deploy@rubytw2.cloudapp.net", :primary => true
