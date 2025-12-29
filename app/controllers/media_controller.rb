class MediaController < ApplicationController
  before_action :set_media, only: [ :show, :edit, :update ]
  before_action :check_login, only: [ :new, :create, :edit, :update ]

  # GET /media
  def index
    @media = Medium.alphabetical
  end

  # GET /media/1
  def show
  end

  # GET /media/new
  def new
    @medium = Medium.new
  end

  # GET /media/1/edit
  def edit
  end

  # POST /media
  def create
    @medium = Medium.new(media_params)

    if @medium.save
      redirect_to medium_path(@medium), notice: "#{@medium.name} was successfully created in the system."
    else
      render :new
    end
  end

  # PATCH/PUT /media/1
  def update
    if @medium.update(media_params)
      redirect_to medium_path(@medium), notice: "#{@medium.name} was successfully updated in the system."
    else
      render :edit
    end
  end

  private
  def set_media
    @medium = Medium.find(params[:id])
  end

  def media_params
    params.require(:medium).permit(:name, :media_type)
  end
end
