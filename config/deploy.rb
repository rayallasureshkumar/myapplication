# require 'capistrano/ext/multistage'
# config valid only for current version of Capistrano
#lock '3.4.0'
#require 'bundler/capistrano'
set :application, 'myapplication'

set :scm, :git
set :repository, "git@github.com:rayallasureshkumar/myapplication.git"
set :repo_url, "git@github.com:rayallasureshkumar/myapplication.git"
set :branch, 'master' # remote branch
set :deploy_via, :remote_cache
#set :git_shallow_clone, 1
#set :git_enable_submodules, 1 # If you have public like github.com then use :remote_cache
#set :use_sudo, false
# ssh_options = {keys: ["#{ENV['HOME']}/.ssh/dev.pem"], forward_agent: true}


set :user, "akhil"
#set :ssh_key, "akhil.pem"
#set :use_sudo, true



set :deploy_to,  "/home/akhil/work/suresh"
#set :ssh_options, { :forward_agent => true }
#set :default_run_options, {:pty => true}
 set :keep_releases, 2


#set :ssh_options, {:forward_agent => true}


# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
# server "192.168.0.65", :app, :web, :db, :primary => true
role :web, "akhil@192.168.0.65"                          # Your HTTP server, Apache/etc
role :app, "akhil@192.168.0.65"                          # This may be the same as your `Web` server
role :db,  "akhil@192.168.0.65", :primary => true 				# This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
  task :start do 
    run "mkdir #{ /home/akhil/work/suresh }/new"
    run "mv current releases/old && mv releases/new current"
    run "rm -rf releases/old"
  end
   task :stop do ; end
   # task :restart, :roles => :app, :except => { :no_release => true } do
   #   run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   # end
   # task :bundle_gems do 
   # 	run "cd #{deploy_to}/current && bundle install vendor/gems"
   # end
 end

#after "deploy"
#after "deploy:bundle_gems",    "deploy:restart"



#set :repo_url, 'git@example.com:me/my_repo.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

# namespace :deploy do

#   after :restart, :clear_cache do
#     on roles(:web), in: :groups, limit: 3, wait: 10 do
#       # Here we can do anything such as:
#       # within release_path do
#       #   execute :rake, 'cache:clear'
#       # end
#     end
#   end

# end
