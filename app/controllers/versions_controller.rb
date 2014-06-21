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
      redirect_to user_path
    else 
      render "edit"
    end 
  end

  def destroy
  end


protected

  def version_params 
    params.required(:version).permit(:title, :body)
  end


  def find_version
    @version = Version.find(params[:id])
  end


end



