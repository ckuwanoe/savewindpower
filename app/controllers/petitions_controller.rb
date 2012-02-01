class PetitionsController < ApplicationController
  def index
    @petition = Petition.new
  end
  
  def create
    @petition = Petition.new(params[:petition])

    respond_to do |format|
      if @petition.save
        ThanksMailer.send_thanks(@petition).deliver
        format.html { redirect_to(thanks_path, :notice => '') }
        format.xml  { render :xml => @petition, :status => :created, :location => @petition }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @petition.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def thanks
  end
end
