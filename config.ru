# http://recipes.sinatrarb.com/p/deployment/apache_with_passenger

require 'rubygems'
require 'sinatra'
require 'logger'
require File.expand_path '../testers.rb', __FILE__

# https://groups.google.com/forum/#!topic/sequel-talk/kh-MX2IoZwg
if defined?(PhusionPassenger)
  # Apache logs for us.
  set :logging, false
  PhusionPassenger.on_event(:starting_worker_process) do |forked|
    if forked
      Sequel::DATABASES.each { |db| db.disconnect }
    else
      # We're in direct spawning mode. We don't need to do anything.
    end
  end
end

run Sinatra::Application

# Local Variables:
# compile-command: "bundle exec rackup"
# End:
