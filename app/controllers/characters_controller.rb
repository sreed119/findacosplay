class CharactersController < ApplicationController
  before_action :set_character, only: [ :show, :edit, :update ]
  before_action :check_login, only: [ :new, :create, :edit, :update ]

  # GET /characters
  def index
    @characters = Character.alphabetical
  end

  # GET /characters/1
  def show
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
      redirect_to character_path(@character), notice: "#{@character.name} was successfully created in the system."
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
