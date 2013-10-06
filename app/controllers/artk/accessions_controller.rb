module Artk
class AccessionsController < Artk::ApplicationController

  def index
    @accessions = Accession.find(:all)
    respond_to do |format|
      format.html { render :layout => false, :text => @accessions.to_json }
      format.json { render :layout => false, :text => @accessions.to_json }
      format.js   { render :layout => false, :text => @accessions.to_json }
    end
  end

end
end