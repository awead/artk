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

end