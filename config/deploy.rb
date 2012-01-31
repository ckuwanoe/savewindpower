# RVM bootstrap
$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require 'rvm/capistrano'
set :rvm_ruby_string, '1.9.2-p290'
set :rvm_type, :system

# bundler bootstrap
require 'bundler/capistrano'

# main details
server "fieldreport.me", :app, :web, :db, :primary => true

# server details
default_run_options[:pty] = true
ssh_options[:user] = "ubuntu"
ssh_options[:forward_agent] = true
set :application, "savewindpower"
set :deploy_to,  "/var/www/#{application}"
set :deploy_via, :remote_cache
set :user, "ubuntu"
set :use_sudo, false

# repo details
set :scm, :git
set :repository, 'git@github.com:ckuwanoe/savewindpower.git' # your private/public url and user
set :branch, "master"
set :git_enable_submodules, 1

after 'deploy:update_code' do
  run "cd #{release_path}; RAILS_ENV=production bundle exec rake assets:precompile"
end

# tasks
namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
end