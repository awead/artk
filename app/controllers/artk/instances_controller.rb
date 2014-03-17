module Artk
class InstancesController < Artk::ApplicationController

  def index
    @instances = Resource.find_by_ead_id(params[:resource_id]).component(params[:component_id]).instances
  end
  
end
end
