### Schema

#[:testings, :users, :systems, :releases, :browsers].each do |x|
#  DB.drop_table? x
#end

DB.create_table? :browsers do
  primary_key :id
  String :name, :unique => true
end

DB.create_table? :releases do
  primary_key :id
  String :name, :unique => true
end

DB.create_table? :systems do
  primary_key :id
  String :name, :unique => true
end

DB.create_table? :users do
  primary_key :id
  String :name, :unique => true
end

DB.create_table? :testings do
  primary_key :id
  foreign_key :user_id, :users
  foreign_key :release_id, :releases
  foreign_key :system_id, :systems
  column :browsers, 'text[]'
  TrueClass :ok
  String :ipaddress
  String :notes
  DateTime :created_at
end
