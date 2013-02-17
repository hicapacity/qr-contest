root = "/var/www/contest/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/contest.log"
stdout_path "#{root}/log/contest.log"

listen "/tmp/unicorn.contest.sock"
worker_processes 4
timeout 30
