class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id), notice: 'You made it! Welcome back!'
    else
      flash.now.alert = "Oops, looks like not everything matches up."
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'See you soon!'
  end
end
