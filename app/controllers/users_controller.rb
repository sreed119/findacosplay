class UsersController < ApplicationController
  before_action :set_user, only: [ :show, :edit, :update, :destroy ]
  before_action :check_login, except: [ :new, :create ]
  authorize_resource

  def index
    @users = User.alphabetical
    @admins = User.admins.alphabetical
    @regular_users = User.users.alphabetical
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
    @user.role = "user"

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "New account created successfully. Welcome to Find a Cosplay!"
    else
      flash.now[:alert] = "Error creating account. Please check the form."
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "#{@user.username} account updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to home_path, notice: "User account deleted successfully."
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    if current_user && current_user.admin_role?
      params.require(:user).permit(:username, :email, :role, :password, :password_confirmation, :profile_picture)
    else
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :profile_picture)
    end
  end
end
