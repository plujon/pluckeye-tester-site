### Schema

#[:bonuses, :browsers, :releases, :systems, :testings, :users].each do |x|
#  DB.drop_table? x
#end

DB.create_table? :browsers do
  primary_key :id
  String :name, :unique => true
  constraint(:name_length_range){char_length(name) > 2}
end

DB.create_table? :releases do
  primary_key :id
  String :name, :unique => true
  constraint(:name_length_range){char_length(name) > 2}
end

DB.create_table? :systems do
  primary_key :id
  String :name, :unique => true
  constraint(:name_length_range){char_length(name) > 2}
end

DB.create_table? :users do
  primary_key :id
  String :name, :unique => true
  constraint(:name_length_range){char_length(name) > 2}
end

DB.create_table? :bonuses do
  primary_key :id
  foreign_key :user_id, :users, :index => true
  Integer :points
  String :notes
  DateTime :created_at
end

DB.create_table? :testings do
  primary_key :id
  foreign_key :user_id, :users, :index => true
  String :release, :index => true
  String :system, :index => true
  column :browsers, 'text[]'
  TrueClass :ok
  String :ipaddress
  String :notes
  DateTime :created_at
end
