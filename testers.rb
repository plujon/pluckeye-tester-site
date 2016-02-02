require 'pg'
require 'sequel'
require 'sinatra'

DB = Sequel.postgres('testerdb')
DB.extension :pg_array
Sequel.extension :pg_array_ops
Sequel.inflections do |inflect|
  inflect.plural(/^bonus$/i, 'bonuses')
  inflect.singular(/^bonuses/i, 'bonus')
end

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
  @testings = Testing
  if params[:user] && user = User.find(:name => params[:user].to_s)
    @testings = @testings.where(:user_id => user.id)
  end
  if params[:release] && release = params[:release].to_s
    @testings = @testings.where(:release => release)
  end
  if params[:system] && system = params[:system].to_s
    @testings = @testings.where(:system => system)
  end
  if params[:browsers] && browsers = params[:browsers].sort
    aop = Sequel.pg_array_op(:browsers)
    @testings = @testings.where(aop.overlaps(Sequel.pg_array(browsers)))
  end
  @testings = @testings.all
  erb :testings
end

post '/testings' do
  # Only 1 testing per user/release/system
  user = User.find_or_create(:name => params[:user].to_s)
  release = Release.find_or_create(:name => params[:release].to_s).to_s
  system = System.find_or_create(:name => params[:system].to_s).to_s
  opts = { :user_id => user.id,
           :release => release,
           :system => system }
  testing = Testing.find(opts)
  browsers = params[:browsers].map {
    |x| Browser.find_or_create(:name => x.to_s).to_s
  }.sort
  opts[:browsers] = Sequel.pg_array(browsers)
  opts[:ok] = params[:ok] === "ok" ? true : false
  opts[:ipaddress] = request.ip.to_s
  opts[:notes] = params[:notes].to_s
  opts[:created_at] = Time.now
  if testing
    testing.update(opts)
  else
    Testing.create(opts)
  end
  redirect to("/testings?thankyou=yes&user=#{user}")
end

get '/user/:id' do
  user_id = params[:id].to_i
  if 0 == user_id
    opts = { :name => params[:id].to_s }
  else
    opts = { :id => user_id }
  end
  @user = User.find(opts)
  erb :user
end

get '/bonuses' do
  @bonuses = Bonus.all
  @bonuses = Bonus
  if params[:user]
    user_id = params[:user].to_i
    if 0 == user_id
      user = User.find(:name => params[:user].to_s)
      user_id = user.id if user
    end
    @bonuses = @bonuses.where(:user_id => user_id)
  end
  @bonuses = @bonuses.all
  erb :bonuses
end

get '/scores' do
  @users = User.all.sort { |a,b| b.points <=> a.points }
  erb :scores
end

get '/sand' do
  request.inspect
end
