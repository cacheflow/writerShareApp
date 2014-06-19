class VersionsController < ApplicationController
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
    @version = Version.find(params[:id])
  end

  def edit
    @version = Version.find(params[:id])
  end

  def update
    @version = Version.find(params:[id])
    if @version.update(version_params)
      redirect_to (@version)
    else 
      render "edit"
    end 
  end

  def destroy
    @version = Version.destroy(params:[id])
  end



def version_params 
  params.required(:version).permit()
end

end



