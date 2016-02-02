### Models

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
  def to_s; name end
end
