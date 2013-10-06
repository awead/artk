module Artk
class ResourcesController < Artk::ApplicationController

  def index
    @results = Resource.finding_aids.collect { |fa| fa.pid_and_title }
    respond_to do |format|
      format.html { render :layout => false, :text => @results.to_json }
      format.json { render :layout => false, :text => @results.to_json }
      format.js   { render :layout => false, :text => @results.to_json }
    end
  end

  def show
    @resource = Resource.find_by_ead_id(params[:id])
    if @resource.nil?
      redirect_to :status => 404 
    else
      respond_to do |format|
        format.html { render :layout => false, :text => @resource.to_json }
        format.json { render :layout => false, :text => @resource.to_json }
        format.js   { render :layout => false, :text => @resource.to_json }
      end
    end

  end

end
end