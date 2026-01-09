class ItemsController < ApplicationController
  before_action :set_item, only: [ :show, :edit, :update, :destroy ]
  before_action :check_login, only: [ :new, :create, :edit, :update, :destroy ]
  authorize_resource

  # GET /items
  def index
    @items = Item.alphabetical
    if params[:query].present?
      @items = @items.search(params[:query])
    end
    if params[:status].present?
      @items = @items.active
    end
    if params[:category].present?
      @items = @items.by_category(params[:category])
    end
  end

  # GET /items/1
  def show
    @is_saved = false
    if current_user
      @is_saved = current_user.items.exists?(@item.id)
      @user_item = current_user.user_items.find_by(item_id: @item.id)
    end
    @average = UserItem.where(item_id: @item.id).average(:rating)
    if @average
      @average = @average.round
    end
    @reviews = UserItem.where(item_id: @item.id).where.not(review: [ nil, "" ]).order(created_at: :desc)
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
      redirect_to item_path(@item), notice: "Item was successfully created in the system."
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

  def destroy
    @item.make_inactive
    # Items cannot be fully destroyed, but can be set to inactive if out of stock or equivalent
    redirect_to items_path, notice: "#{@item.name} was successfully made inactive in the system."
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :store, :image, :item_link, :price, :category, :active)
  end
end
