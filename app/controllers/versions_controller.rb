class VersionsController < ApplicationController
  before_action :find_version, :only => [:show, :edit, :update, :destroy]
  
  def index
    @versions = current_user.versions
  end

  def new
    @version = current_user.versions.new
  end

  def create
    @version = current_user.versions.new(version_params)
    # @submission = @venue.submissions.new(submission_params.merge(user: current_user))
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



