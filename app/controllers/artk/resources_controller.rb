module Artk
class ResourcesController < Artk::ApplicationController

  def index
    @results = return_resource_results.collect { |fa| fa.pid_and_title }
    return_response
  end

  def show
    @results = Resource.find_by_ead_id(params[:id])
    if @results.nil?
      redirect_to :status => 404 
    else
      return_response
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