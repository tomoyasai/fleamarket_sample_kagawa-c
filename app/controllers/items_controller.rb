class ItemsController < ApplicationController

  before_action :set_categories, only: [:new, :create, :edit, :update]

  def index
    @items=Item.includes(:user)
  end

  def show
    @item = Item.find(params[:id])
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

  def buyconfirm
  end

  def card_new
    @years=[]
    11.times do |index|
      this_year=Date.today.year%100
      @years.push(this_year+index)
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :info, :image,:category_id, :status_id, :delivery_fee_id, :delivery_days_id, :prefecture_id, :price).merge(user_id: current_user.id)
  end

  def set_categories
    @categories = Category.all
  end
  
end


