class VersionsController < ApplicationController
  before_action :find_version, :only => [:show, :edit, :update, :destroy]
  
  def index
    @versions = Versions.all 
  end

  def new
    @version = Version.new
  end

  def create
    @version = Version.create(version_params)
  end

  def show
    
  end

  def edit
    
  end

  def update
    
    if @version.update(version_params)
      redirect_to (@version)
    else 
      render "edit"
    end 
  end

  def destroy
    
  end



def version_params 
  params.required(:version).permit()
end

end



