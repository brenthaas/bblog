set :application, 'bblog'
set :repo_url, 'git@github.com:brenthaas/bblog.git'
set :branch, 'master'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, "/home/apps/bblog"
set :scm, :git
set :keep_releases, 5
set :user, 'devops'

set :format, :pretty

namespace :deploy do
  task :start do
    execute :sv, "up bblog"
    # run "sudo sv up bblog"
  end
  task :stop do
    execute :sv, "down bblog"
    # run "sudo sv down bblog"
  end
  task :restart do
    execute :sv, "restart bblog"
    # run "sudo sv restart bblog"
  end
  after :finishing, 'deploy:cleanup'
end
