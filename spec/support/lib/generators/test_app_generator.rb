require 'rails/generators'

class TestAppGenerator < Rails::Generators::Base
  source_root File.expand_path("../../../../support", __FILE__)

  def inject_routes
    insert_into_file "config/routes.rb", :after => ".draw do" do
      %{

  mount Artk::Engine => '/artk'

      }
    end
  end

  def configure_database
    append_file "config/database.yml", '

artk_development:
  adapter: mysql2
  encoding: utf8
  reconnect: false
  database: atk
  pool: 5
  username: root
  password: password 
  host: localhost

artk_test:
  adapter: mysql2
  encoding: utf8
  reconnect: false
  database: bl_test
  pool: 5
  username: root
  password: password
  host: localhost

artk_production:
  adapter: mysql2
  encoding: utf8
  reconnect: false
  database: bl_prod
  pool: 5
  username: root
  password: password
  host: localhost
'
  end

end