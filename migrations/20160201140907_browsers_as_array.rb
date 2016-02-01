### Migrations
#
# Run with sequel -m ./migrations

# Sequel.migration do
#   up do
#     add_column :testings, :browsers, String
#     from(:testings).update(:browsers => 'firefox')
#     drop_column :testings, :browser_id
#   end
#   down do
#     add_column :testings, :browser_id, Integer
#     firefox = Browser.find(:name => 'firefox')
#     from(:testings).update('SET browser_id = ?', firefox.id)
#     drop_column :testings, :browsers
#   end
# end
