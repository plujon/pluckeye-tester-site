require 'sequel'
require 'sinatra'
require 'pg'

DB = Sequel.postgres('testerdb')

load File.dirname(__FILE__) + '/schema.rb'
load File.dirname(__FILE__) + '/models.rb'
load File.dirname(__FILE__) + '/seeds.rb'

get '/' do
  redirect to('/testings/new')
end

get '/testings/new' do
  erb :form
end

get '/testings' do
  erb :testings
end

post '/testings' do
  # Only 1 testing per user/release/system/browser
  user = User.find_or_create(:name => params[:user])
  release = Release.find_or_create(:name => params[:release])
  system = System.find_or_create(:name => params[:system])
  browser = Browser.find_or_create(:name => params[:browser])
  opts = { :user_id => user.id,
           :release_id => release.id,
           :system_id => system.id,
           :browser_id => browser.id }
  testing = Testing.find(opts)
  opts[:ok] = params[:ok] === "ok" ? true : false
  opts[:ipaddress] = request.ip
  opts[:notes] = params[:notes]
  opts[:created_at] = Time.now
  if testing
    testing.update(opts)
  else
    Testing.create(opts)
  end
  erb :thank_you
end

get '/sand' do
  request.inspect
end
