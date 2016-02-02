### Models

class Bonus < Sequel::Model
  many_to_one :user
  def date; created_at.strftime("%y-%m-%d") end
  def to_s; "+" + points.to_s + " " + user.to_s + " : " + notes end
end

class Browser < Sequel::Model
  def to_s; name end
end

class Release < Sequel::Model
  def to_s; name end
end

class System < Sequel::Model
  def to_s; name end
end

class Testing < Sequel::Model
  many_to_one :user
  def date
    created_at.strftime("%Y-%m-%d")
  end
end

class User < Sequel::Model
  one_to_many :testings
  one_to_many :bonuses
  def points
    @points ||=
      testings.reduce(0) { |acc, x|
      acc + 10 + 3 * (x.browsers.size - 1)
    } +
      bonuses.reduce(0) { |acc, x|
      acc + x.points
    }
  end
  def score; points; end
  def to_s; name end
end
