class SessionsController < ApplicationController
  
  include ApplicationHelper

  def new
  end

  def index
  end 

  def create
    @user = User.where(email: params[:session][:email]).first

    if @user && @user.authenticate(params[:session][:password])
      session_create
      redirect_to users_path, notice: "You have successfully logged in."
    else
      flash.now[:notice] = "Invalid login/password combination. Please try again."
      render :new
    end
  end

  def destroy
    session.delete(:remember_token)
    redirect_to new_session_path
  end

end