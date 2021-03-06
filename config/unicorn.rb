root = "/var/www/contest.hicapacity.org/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "#{root}/tmp/sockets/unicorn.sock"
worker_processes 4
timeout 30
