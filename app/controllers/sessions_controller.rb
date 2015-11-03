class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      redirect_to root_path, notice: 'You made it! Welcome back!'
    else
      flash.now.alert = "Oops, looks like not everything matches up."
      render "new"
    end
  end

  def destroy
    redirect_to root_url, notice: 'See you soon!'
  end
end
