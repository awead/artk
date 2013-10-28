module Artk
class ComponentsController < Artk::ApplicationController

  def index
    @results = Resource.find_by_ead_id(params[:resource_id]).all_series.collect { |s| s.pid_and_title }
    return_response
  end

  def show
    @results = Resource.find_by_ead_id(params[:resource_id]).component(params[:id])
    return_response
  end

  private

  def return_response
    if request.xhr?
      render :layout => false, :text => @results.to_json
    else
      respond_to do |format|
        format.html
        format.json { render :layout => false, :text => @results.to_json }
      end
    end
  end
  
end
end