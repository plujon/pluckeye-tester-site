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

  def level(points)
    # incr = 0
    # 20.times.reduce([]) { |acc, x|
    #   incr += 10
    #   acc + [(acc.last || 0) + incr]
    # }
    levels = [10, 30, 60, 100, 150, 210, 280, 360, 450, 550, 660, 780, 910, 1050, 1200, 1360, 1530, 1710, 1900, 2100]
    level = 0
    levels.each do |x|
      return level if points < x
      level += 1
    end
    level
  end

  def rank(points)
    ary =
      [
       :wheat,
       :flour,
       :bread,
       :slice_of_bread,
       :toast,
       :onion,
       :turkey,
       :sandwich,
       :saliva,
       :chew,
       :enzyme,
       :bolus,
       :pharynx,
       :epiglottis,
       :esophagus,
       :peristalsis,
       :stomach,
       :hydrocloric_acid,
       :bile,
       :intestines
      ]
    ary =
      [
       :centaur,
       :ogre,
       :gargoyle,
       :lion,
       :troll,
       :cyclops,
       :ranger,
       :gorgon,
       :minitaur,
       :warbear,
       :behemoth,
       :unicorn,
       :wyvern,
       :griphon,
       :giant,
       :dragon,
       :hydra,
       :serpent,
       :colossus,
       :titan
      ]
    ary[level(points)]
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
