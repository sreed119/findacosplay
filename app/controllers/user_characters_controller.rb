class UserCharactersController < ApplicationController
  before_action :set_user_character, only: [ :destroy ]
  authorize_resource

  # GET /user_characters or /user_characters.json
  def index
    @user_characters = UserCharacter.where(user_id: current_user.id)
  end

  # GET /user_characters/new
  def new
    @user_character = UserCharacter.new(character_id: params[:character_id])
  end

  # POST /user_characters or /user_characters.json
  def create
    @user_character = UserCharacter.new(user_character_params)
    @user_character.user = current_user

    if @user_character.save
      redirect_to user_characters_path, notice: "Character was successfully added to your saves."
    else
      render :new
    end
  end

  # DELETE /user_characters/1 or /user_characters/1.json
  def destroy
    @user_character.destroy
    redirect_to user_characters_path, notice: "Saved character was successfully removed."
  end

  private
  def set_user_character
    @user_character = UserCharacter.find(params[:id])
  end

  def user_character_params
    params.require(:user_character).permit(:character_id, :purchased, :rating, :review)
  end
end
