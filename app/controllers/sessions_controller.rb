class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      flash[:success] = "Logged in as #{@user.email}"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now[:danger] = "Invalid login details. Please try again."
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
    flash[:success] = "You have been logged out."
  end

end
