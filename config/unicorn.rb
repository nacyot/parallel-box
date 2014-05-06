# from https://devcenter.heroku.com/articles/rails-unicorn
worker_processes Integer(ENV["UNICORN_WORKER"] || 4)
timeout 15
preload_app true

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end
  
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end
