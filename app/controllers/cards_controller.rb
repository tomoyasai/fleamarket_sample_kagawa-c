class CardsController < ApplicationController
  require 'payjp'

  before_action :set_api_key

  def new
    @years=[]
    11.times do |index|
      this_year=Date.today.year%100
      @years.push(this_year+index)
    end
  end

  def create
    # binding.pry
    if params['payjp-token'].blank?
      redirect_to action: "new"
      # トークンが取得出来てなければループ
    else
      user_id = current_user.id
      customer = Payjp::Customer.create(
      card: params['payjp-token']
      # params['payjp-token']（response.id）からcustomerを作成
      ) 
      @card = Card.new(user_id: user_id, customer_id: customer.id, paycard_id: customer.default_card)
      if @card.save
        flash[:notice] = '登録しました'
        redirect_to "/"
      else
        flash[:alert] = '登録できませんでした'
        redirect_to action: "new"
      end
    end
  end

  def show
  end

  def set_api_key
    Payjp.api_key = Rails.application.credentials[:payjp][:SECRET_KEY]
  end

  def buy
    @item = Item.find(params[:id])
    @card = Card.find_by(user_id: current_user.id)
    # binding.pry
    # Payjp.api_key = Rails.application.credentials[:payjp][:SECRET_KEY]
    charge = Payjp::Charge.create(
      amount: @item.price,
      customer: @card.customer_id,
      currency: 'jpy',
    )
  end
end

# class CardsController < ApplicationController
#   require "payjp"

  # def card_new
  #   @years=[]
  #   11.times do |index|
  #     this_year=Date.today.year%100
  #     @years.push(this_year+index)
  #   end
  # end

  # def new
  #   @years=[]
  #   11.times do |index|
  #     this_year=Date.today.year%100
  #     @years.push(this_year+index)
  #   end
#     @card = Card.where(user_id: current_user.id)
#     # 以下、いったんコメントアウト
#     # redirect_to action: "show" if card.exists?
#   end

#   def pay #payjpとCardのデータベース作成を実施
#     Payjp.api_key = ENV["sk_test_07bba317149999aca50ff848"]
#     if params['payjp-token'].blank?
#       redirect_to action: "new"
#     else
#       customer = Payjp::Customer.create(
#       # description: '登録テスト', #なくてもOK
#       # email: current_user.email, #なくてもOK
#       card: params['payjp-token'],
#       # metadata: {user_id: current_user.id}
#       ) #念の為metadataにuser_idを入れましたがなくてもOK
#       @card = Card.new(user_id: current_user.id, customer_id: customer.id, paycard_id: customer.default_card)
#       if @card.save
#         redirect_to action: "show"
#       else
#         redirect_to action: "pay"
#       end
#     end
#   end

#   def delete #PayjpとCardデータベースを削除
#     card = Card.where(user_id: current_user.id).first
#     if card.blank?
#     else
#       Payjp.api_key = ENV["sk_test_07bba317149999aca50ff848"]
#       customer = Payjp::Customer.retrieve(card.customer_id)
#       customer.delete
#       card.delete
#     end
#       redirect_to action: "new"
#   end

#   def show #Cardのデータpayjpに送り情報を取り出し
#     card = Card.where(user_id: current_user.id).first
#     if card.blank?
#       redirect_to action: "new" 
#     else
#       Payjp.api_key = ENV["sk_test_07bba317149999aca50ff848"]
#       customer = Payjp::Customer.retrieve(card.customer_id)
#       @default_card_information = customer.cards.retrieve(card.card_id)
#     end
#   end