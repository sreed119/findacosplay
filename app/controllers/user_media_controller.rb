class UserMediaController < ApplicationController
  before_action :set_user_medium, only: [ :destroy ]
  before_action :check_login
  authorize_resource

  # GET /user_media
  def index
    @user_media = UserMedium.where(user_id: current_user.id)
  end

  def new
    @user_medium = UserMedium.new
  end

  def create
    @user_medium = UserMedium.new(user_medium_params)
    @user_medium.user = current_user

    if @user_medium.save
      redirect_to user_media_path, notice: "Media was successfully added to your saves."
    else
      render :new
    end
  end

  def destroy
    @user_medium.destroy
    redirect_to user_media_path, notice: "Saved media was successfully removed."
  end

  private
  def set_user_medium
    @user_medium = UserMedium.find(params[:id])
  end

  def user_medium_params
    params.require(:user_medium).permit(:medium_id, :purchased, :rating, :review)
  end
end
