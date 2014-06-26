class VersionsController < ApplicationController
  before_action :find_version, :only => [:show, :edit, :update, :destroy]
  
  def index
    @versions = current_user.versions
  end

  def new
    @version = current_user.versions.new
    # @version = Version.where(user_id: nil).first
  end

  def create
    @version = current_user.versions.create(version_params)
    if @version.save
    # puts "VEGAS, BABY!" + params.inspect
    # @version = Version.where(user_id: nil).first
    # if @version.update(version_params)
    #   Version.create(title:'', body:'')
       redirect_to user_versions_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
    # @version = Version.where(user_id: nil).first
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

  # def mercury_update
  #   @version = Version.where(user_id: nil).first
  #   @version.title = params[:content][:version_title][:value]
  #   @version.body = params[:content][:version_body][:value]
  #   @version.save!
  #   render html
  #   # render json: { secret_message: "don't eat yellow snow" }
  # end


protected


  def version_params 
    params.require(:version).permit(:title, :body)
  end


  def find_version
    @version = Version.find(params[:id])
  end


end



