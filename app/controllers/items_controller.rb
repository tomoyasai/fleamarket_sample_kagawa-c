class ItemsController < ApplicationController
  def index
  end

  def show
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    unless @item.valid?
      render :new and return
    end

    @item.save
    redirect_to root_path
  end

  def buyconfirm
  end


  private
  def item_params
    params.require(:item).permit(:name, :info, :image,:category_id, :status_id, :delivery_fee_id, :delivery_days_id, :prefecture_id, :price).merge(user_id: 1)
  end
end


