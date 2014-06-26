class VersionsController < ApplicationController
  before_action :find_version, :only => [:show, :edit, :update, :destroy]
  
  def index
    # shows the index of versions of the user's version index page
    @versions = current_user.versions
  end

  def new
    # a new instance of a version is created with respect to a user
    @version = current_user.versions.new
  end

  def create
    # instantiates a new version with respect to a user. If this fails for some reason, the user is directed to the new version path
    @version = current_user.versions.create(version_params)
    if @version.save
      redirect_to user_versions_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end


  def update
    # updates a version based upon the version_params method that is in the protected section below.
    if @version.update(version_params)
      redirect_to user_path
    else 
      render "edit"
    end 
  end

  def destroy
  end



protected


  def version_params 
    params.require(:version).permit(:title, :body)
  end


  def find_version
    @version = Version.find(params[:id])
  end


end



