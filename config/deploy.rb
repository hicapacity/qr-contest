require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rbenv'

set :domain,        'hicapacity.org'
set :port,          '2242'
set :user,          'deployer'
set :deploy_to,     '/var/www/contest.hicapacity.org'
set :repository,    'git@github.com:hicapacity/qr-contest.git'
set :branch,        'master'
set :keep_releases, 2
set :forward_agent, true

set :shared_paths, ['db/production.sqlite3', 'config/settings.local.yml', 'log', 'tmp']

task :environment do
  invoke :'rbenv:load'
end

task :setup => :environment do
  queue! %[mkdir -p "#{deploy_to}/shared/tmp"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/tmp"]
  
  queue! %[mkdir -p "#{deploy_to}/shared/tmp/pids"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/tmp/pids"]
  
  queue! %[mkdir -p "#{deploy_to}/shared/tmp/sockets"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/tmp/sockets"]
  
  queue! %[mkdir -p "#{deploy_to}/shared/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/log"]

  queue! %[mkdir -p "#{deploy_to}/shared/config"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/config"]

  #queue! %[touch "#{deploy_to}/shared/config/database.yml"]
  #queue  %[-----> Be sure to edit 'shared/config/database.yml'.]
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'

    to :launch do
      queue '/etc/init.d/unicorn_contest.sh upgrade'
    end
  end
end

namespace :unicorn do
  %w(start stop force-stop restart upgrade reopen-logs).each do |action|
    desc "#{action.capitalize} Unicorn"
    task action.to_sym do
      queue %[echo "-----> #{action.capitalize} Unicorn..."]
      queue! "/etc/init.d/unicorn_contest.sh #{action}"
    end
  end
end