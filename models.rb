### Models

class User < Sequel::Model
  one_to_many :testings
  def to_s; name end
end

class Testing < Sequel::Model
  many_to_one :user
  many_to_one :release
  many_to_one :system
  many_to_one :browser
end

class Release < Sequel::Model
  def to_s; name end
end

class System < Sequel::Model
  def to_s; name end
end

class Browser < Sequel::Model
  def to_s; name end
end
