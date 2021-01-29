class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :info, :category_id, :status_id, :delivery_fee_id, :delivery_days_id, :prefecture_id, :price)
  end
end

# t.string :name, null: false
# t.text :info, null: false
# t.references :category, null: false, foreign_key: true
# t.integer :status_id, null: false
# t.integer :delivery_fee_id, null: false
# t.integer :prefecture_id, null: false
# t.integer :delivery_days_id, null: false
# t.integer :user_id, null: false, foreign_key: true
# t.integer :price, null: false
