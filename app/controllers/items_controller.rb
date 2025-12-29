class ItemsController < ApplicationController
  before_action :set_item, only: [ :show, :edit, :update ]
  before_action :check_login, only: [ :new, :create, :edit, :update ]

  # GET /items
  def index
    @items = Item.alphabetical
  end

  # GET /items/1
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to item_path(@item), notice: "#{@item.name} was successfully created in the system."
    else
      render :new
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      redirect_to item_path(@item), notice: "#{@item.name} was successfully updated in the system."
    else
      render :edit
    end
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :store, :image, :item_link, :price, :category, :active)
  end
end
