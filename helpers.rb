helpers do
  def admin_only!
    return if admin?
    headers['WWW-Authenticate'] = 'Basic realm="Restricted Area"'
    halt 401, "Not authorized\n"
  end

  def admin?
    @auth ||=  Rack::Auth::Basic::Request.new(request.env)
    require File.dirname(__FILE__) + '/.credentials.rb'
    @auth.provided? and @auth.basic? and @auth.credentials and @auth.credentials == credentials
  end

  def link_to(o)
    case o
    when User
      "<a href=\"/users/#{o.id}\">#{o}</a>"
    else
      "#{o}"
    end
  end
end
