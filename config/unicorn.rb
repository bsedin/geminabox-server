app_root = File.expand_path('../..', __FILE__)

require 'bundler/setup'
require 'dotenv'

Dotenv.load

log_file   = ENV['GEMINABOX_LOG'] || File.join(app_root, 'log/unicorn.log')
pid_file   = ENV['GEMINABOX_PID'] || File.join(app_root, 'tmp/unicorn.pid')

working_directory app_root
worker_processes ENV['GEMINABOX_WORKERS_COUNT'] || 2

preload_app true
timeout 30
listen ENV['GEMINABOX_SOCKET'] || "#{ENV['GEMINABOX_HOST']}:#{ENV['GEMINABOX_PORT']}"

pid pid_file
stdout_path log_file
