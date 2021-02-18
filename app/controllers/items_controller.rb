class ItemsController < ApplicationController

  before_action :set_categories, only: [:new, :create, :edit, :update]
  before_action :find_item, only: [:show, :edit, :update, :check_seller]
  before_action :check_seller, only: [:edit, :update]
  def index
    @items=Item.includes(:user)
  end

  def show
  end
  
  def new
    @item = Item.new
    @categories=Category.roots
  end

  def get_category
    selected_category=Category.find(params[:category_id])
    @categories=selected_category.children
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render "new"
    end
  end

  def edit
    @categories = Category.roots
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end
  
  def destroy
    item = Item.find(params[:id])
    if current_user.id == item.user.id
      item.destroy
      redirect_to root_path
    else 
      redirect_to item_path(item.id)
    end
  end

  def buyconfirm
    @item = Item.find(params[:id])
    @address = Address.find(params[:id])
    @user = current_user

    # Payjp.api_key = Rails.application.credentials[:payjp][:SECRET_KEY]
    # charge = Payjp::Charge.create(
    #   :amount => @item.price,
    #   :card => @card.customer_id,
    #   :currency => 'jpy'
  end

  def search
    @items = Item.search(params[:keyword])
  end

  private
  def item_params
    params.require(:item).permit(:name, :info, :image,:category_id, :status_id, :delivery_fee_id, :delivery_days_id, :prefecture_id, :price).merge(user_id: current_user.id)
  end

  def set_categories
    @categories = Category.all
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def check_seller
    if @item.user_id != current_user.id
      redirect_to action: :index
    end
  end
end


