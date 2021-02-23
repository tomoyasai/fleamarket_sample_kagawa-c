class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :edit, :buyconfirm]
  before_action :find_item, only: [:show, :edit, :update, :check_seller, :buyconfirm]
  before_action :check_seller, only: [:edit, :update]

  
  def index
    @items = Item.includes(:user)

  end

  def show
    @buy_data = BuyData.find_by(item_id: @item.id)
  end
  
  def new
    @item = Item.new
    @categories=Category.roots
  end

  def get_category
    selected_category = Category.find(params[:category_id])
    @categories=selected_category.children
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      @categories=Category.roots
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
      @categories=Category.roots
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
    unless @item.user_id != current_user.id
      redirect_to item_path
    end
      
    @card = Card.find_by(user_id: current_user.id)
    if @card == nil
    redirect_to new_card_path, notice: 'カードを登録してください'
      
    else
    @address = Address.find(current_user.id)
    @user = current_user
    @customer = Payjp::Customer.retrieve(@card.customer_id)
    @card_information = @customer.cards.retrieve(@card.paycard_id)
    end
  end

  def search
    @items = Item.search(params[:keyword])
  end

  private
  def item_params
    params.require(:item).permit(:name, :info, :image, :category_id, :status_id, :delivery_fee_id, :delivery_days_id, :prefecture_id, :price).merge(user_id: current_user.id)
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