class UsersController < ApplicationController
  before_action :set_user, :only =>[:show, :edit, :update, :destroy]

  def index
    @user = User.new
    # The below code allows for the display of all users when there is no search query present, and for just the search results to be displayed when there is a search query.
    if params[:search] && !params[:search].empty?
      @users = User.search(params[:search]).order("created_at")
    else
      @users = User.all
    end
  end

  def search
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # session_create is a method that lives in the ApplicationController that is called both when creating a new user and when logging in. Here it is being called so that when a user creates a new account, they are also logged in.
      session_create
      redirect_to users_path
    else
      render 'new'
    end

  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to new_user_path
  end


  protected

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :password, :password_confirmation)
  end

  def set_user 
    @user = User.find(params[:id])
  end


end
