class UserItemsController < ApplicationController
  before_action :set_user_item, only: [ :edit, :update, :destroy ]
  before_action :check_login

  # GET /user_items
  def index
    @user_items = UserItem.where(user_id: current_user.id)
  end

  def new
    @user_item = UserItem.new
  end

  def create
    @user_item = UserItem.new(user_item_params)
    @user_item.user = current_user

    if @user_item.save
      redirect_to user_items_path, notice: "Item was successfully added to your saves."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user_item.update(user_item_params)
      redirect_to user_items_path, notice: "Saved item was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @user_item.destroy
    redirect_to user_items_path, notice: "Saved item was successfully removed."
  end

  private
  def set_user_item
    @user_item = UserItem.find(params[:id])
  end

  def user_item_params
    params.require(:user_item).permit(:item_id, :purchased, :rating, :review)
  end
end
