set :default_env, { path: "/usr/local/ruby22/bin:$PATH" }
set :branch, "master"
set :stage, :production
set :deploy_to, '/home/rubytw/2015.rubyconf.tw'
role :web, "rubytw@60.250.121.194"
role :app, "rubytw@60.250.121.194"
role :db,  "rubytw@60.250.121.194", :primary => true
