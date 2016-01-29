# http://recipes.sinatrarb.com/p/deployment/apache_with_passenger

require 'rubygems'
require 'sinatra'
require 'logger'
require File.expand_path '../testers.rb', __FILE__

# Apache logs for us.
if 'production' === ENV['RACK_ENV']
  set :logging, false
end

run Sinatra::Application

# Local Variables:
# compile-command: "bundle exec rackup"
# End:
