module Artk
class ComponentsController < Artk::ApplicationController

  def index
    @results = Resource.find_by_ead_id(params[:resource_id]).all_series.collect { |s| s.pid_and_title }
    respond_to do |format|
      format.html { render :layout => false, :text => @results.to_json }
      format.json { render :layout => false, :text => @results.to_json }
      format.js   { render :layout => false, :text => @results.to_json }
    end
  end

  def show
    @results = Resource.find_by_ead_id(params[:resource_id]).component(params[:id])
    respond_to do |format|
      format.html { render :layout => false, :text => @results.to_json }
      format.json { render :layout => false, :text => @results.to_json }
      format.js   { render :layout => false, :text => @results.to_json }
    end
  end
  
end
end