class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end



  def update
    @user = User.find(params[:id])
    if @user.update user_params
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:f_name, :l_name, :username, :email, :password, :password_confirmation)
    end
end
