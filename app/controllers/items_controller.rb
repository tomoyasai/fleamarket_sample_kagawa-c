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
    params.require(:item).permit(:name, :info, :image,:category_id, :status_id, :delivery_fee_id, :delivery_days_id, :prefecture_id, :price).merge(user_id: 1)
  end
end


