class PetitionsController < ApplicationController
  def index
    @petition = Petition.new
  end
end
