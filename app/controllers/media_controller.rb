class MediaController < ApplicationController
  before_action :set_media, only: [ :show, :edit, :update, :destroy ]

  # GET /media
  def index
    @media = Media.alphabetical
  end

  # GET /media/1
  def show
  end

  # GET /media/new
  def new
    @media = Media.new
  end

  # GET /media/1/edit
  def edit
  end

  # POST /media
  def create
    @media = Media.new(media_params)

    if @media.save
      redirect_to medium_path(@media), notice: "#{@media.name} was successfully created in the system."
    else
      render :new
    end
  end

  # PATCH/PUT /media/1
  def update
    if @media.update(media_params)
      redirect_to medium_path(@media), notice: "#{@media.name} was successfully updated in the system."
    else
      render :edit
    end
  end

  # DELETE /media/1
  def destroy
    @media.destroy
    redirect_to media_path, notice: "Media was successfully destroyed."
  end

  private
  def set_media
    @media = Media.find(params[:id])
  end

  def media_params
    params.require(:media).permit(:name, :media_type)
  end
end
