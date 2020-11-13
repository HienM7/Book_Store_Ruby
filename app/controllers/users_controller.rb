class UsersController < ApplicationController
  before_action :ensure_admin_user!
  before_action :find_user, only: [:show, :edit, :update, :destroy ]
 
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
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, :flash => { :success => 'User was successfully created.' }
    else
      render :action => 'new'
    end
  end

  def update

    if @user.update_attributes(user_params)
      redirect_to @user, :flash => { :success => 'User was successfully updated.' }
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, :flash => { :success => 'User was successfully deleted.' }
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

    def find_user
      @user = User.find params[:id]
    end
end
