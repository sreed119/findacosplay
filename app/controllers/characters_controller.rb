class CharactersController < ApplicationController
  before_action :set_character, only: [ :show, :edit, :update ]
  before_action :check_login, only: [ :new, :create, :edit, :update ]
  authorize_resource

  # GET /characters
  def index
    @characters = Character.alphabetical
    if params[:hair_length].present?
      @characters = @characters.with_hair_length(params[:hair_length])
    end
    if params[:hair_color].present?
      @characters = @characters.with_hair_color(params[:hair_color])
    end
    if params[:eye_color].present?
      @characters = @characters.with_eye_color(params[:eye_color])
    end
  end

  # GET /characters/1
  def show
    @is_saved = false
    if current_user
      @is_saved = current_user.characters.exists?(@character.id)
      @user_character = current_user.user_characters.find_by(character_id: @character.id)
    end
    @added_items = @character.items.joins(:character_items).distinct.select("items.*, character_items.id as character_item_id").alphabetical
  end

  # GET /characters/new
  def new
    @character = Character.new
  end

  # GET /characters/1/edit
  def edit
  end

  # POST /characters
  def create
    @character = Character.new(character_params)

    if @character.save
      redirect_to character_path(@character), notice: "Character was successfully created in the system."
    else
      render :new
    end
  end

  # PATCH/PUT /characters/1
  def update
    if @character.update(character_params)
      redirect_to character_path(@character), notice: "#{@character.name} was successfully updated in the system."
    else
      render :edit
    end
  end

  private
  def set_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:name, :medium_id, :image, :hair_color, :hair_length, :eye_color)
  end
end
