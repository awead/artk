module Artk
class ResourcesController < Artk::ApplicationController

  def index
    @results = return_resource_results.collect { |fa| fa.pid_and_title }
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

  private

  def return_resource_results
    if params[:q]
      Resource.where("title like ?", "%"+params[:q]+"%")
    else
      Resource.finding_aids
    end
  end

end
end