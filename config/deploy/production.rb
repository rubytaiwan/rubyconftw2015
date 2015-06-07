set :default_env, { path: "/usr/local/ruby22/bin:$PATH" }
set :branch, "master"
set :stage, :production
role :web, "deploy@rubytw.cloudapp.net"
role :app, "deploy@rubytw.cloudapp.net"
role :db,  "deploy@rubytw.cloudapp.net", :primary => true