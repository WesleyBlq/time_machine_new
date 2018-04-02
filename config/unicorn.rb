# http://unicorn.bogomips.org/
# startup:
#   unicorn_rails -E production -p 8081 -c config/unicorn.rb -D
#
# nginx:
# server {
#   listen 8080;
#   server_name localhost;
#   root /Users/yta7/Documents/rails_projects/mybestlady_v3/public;
#   location ~* \.(ico|css|emoji|gif|jpe?g|png)(\?[0-9]+)?$ {
#           expires max;
#           break;
#   }
#   location / {
#           proxy_set_header   Host $host;
#           proxy_set_header   X-Forwarded-Host $host;
#           proxy_set_header   X-Forwarded-Server $host;
#           proxy_set_header   X-Real-IP        $remote_addr;
#           proxy_set_header   X-Forwarded-For  $proxy_add_x_forwarded_for;
#           proxy_buffering    on;
#           proxy_pass http://localhost:8081;
#   }
# }

rails_env = ENV["RAILS_ENV"] || "development"
rails_root = File.expand_path(__FILE__).split('/')[0..-3].join('/')

port_number = 3000
# port_number = 9099
process_number = rails_env == 'production' ? 2 : 1

puts "unicorn env: #{rails_env}"
puts "unicorn port: #{port_number}"
puts "unicorn process number: #{process_number}"

preload_app true
working_directory rails_root
pid "#{rails_root}/tmp/pids/unicorn.pid"
stderr_path "#{rails_root}/log/unicorn.log"
stdout_path "#{rails_root}/log/unicorn.log"

listen port_number, :tcp_nopush => false

# listen "/tmp/unicorn.ruby-china.sock"
worker_processes process_number
timeout 120

if GC.respond_to?(:copy_on_write_friendly=)
  GC.copy_on_write_friendly = true
end

before_fork do |server, worker|
  # the following is highly recomended for Rails + "preload_app true"
  # as there's no need for the master process to hold a connection
  #
  # LL NOTE:
  # => master node will not serve http request, so it no use to hold the database connection.
  # => https://devcenter.heroku.com/articles/concurrency-and-database-connections
  #
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
  end

  # Before forking, kill the master process that belongs to the .oldbin PID.
  # This enables 0 downtime deploys.
  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      # LL
      # TODO, capistrano3-unicorn MAYBE will take care of this.
      # Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end

after_fork do |server, worker|
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
  end
end
