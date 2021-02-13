class ItemsController < ApplicationController

  # before_action :set_categories, only: [:new, :create, :edit, :update]
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
      @categories=Category.roots
      render "new"
    end
  end

  # def edit
  #   @categories=Category.roots
  # end
  def edit
    @category_grandchildren  = Category.where(id: @item.category_id)
    @category_children     = Category.where(id: @category_grandchildren[0].parent)
    @parent         = Category.where(ancestry: nil)
    @parent_current = Category.find_by(id: @category_children[0].parent.id)

  end

  # def edit
  #   grandchild_category = @item.category
  #   child_category = grandchild_category.parent

  #   @category_parent_array = []
  #   Category.where(ancestry: nil).each do |parent|
  #     @category_parent_array << parent.name
  #   end

  #   @category_children_array = []
  #   Category.where(ancestry: child_category.ancestry).each do |children|
  #     @category_children_array << children
  #   end

  #   @category_grandchildren_array = []
  #   Category.where(ancestry: grandchild_category.ancestry).each do |grandchildren|
  #     @category_grandchildren_array << grandchildren
  #   end
  
  # end

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

  # def set_categories
  #   @categories = Category.all
  # end

  def find_item
    @item = Item.find(params[:id])
  end

  def check_seller
    if @item.user_id != current_user.id
      redirect_to action: :index
    end
  end
  
end


