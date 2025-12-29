class CharacterItemsController < ApplicationController
  before_action :set_character_item, only: [ :destroy ]
  before_action :check_login

  def new
    @character_item = CharacterItem.new
  end

  def create
    @character_item = CharacterItem.new(character_item_params)
    if @character_item.save
      redirect_to character_path(@character_item.character), notice: "Item was successfully added to the character #{@character_item.character.name}."
    else
      render :new
    end
  end

  def destroy
    @character_item.destroy
    redirect_to character_path(@character_item.character), notice: "Item was successfully removed from the character #{@character_item.character.name}."
  end

  private
  def set_character_item
    @character_item = CharacterItem.find(params[:id])
  end

  def character_item_params
    params.require(:character_item).permit(:character_id, :item_id)
  end
end
