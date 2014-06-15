class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path 
    else
      render 'new'
    end

  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    # @user = User.find(params[:id])
    # if 
    #
    # else
    #
    # end
  end

  def destroy
  end

  protected
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user 
    @user = User.find(params[:id])
  end


end
