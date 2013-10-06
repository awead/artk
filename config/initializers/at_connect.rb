# sample connection configuration.  Rename to at_connect.rb 
#
# We override ActiveRecord to connect to our AT Database
ActiveRecord::Base.establish_connection(
  :adapter  => 'mysql2',
  :encoding => 'utf8',
  :database => 'atk',
  :host     => 'localhost',
  :username => 'root',
  :password => 'password'
)