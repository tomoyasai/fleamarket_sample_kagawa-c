class CardsController < ApplicationController
  require 'payjp'

  before_action :set_api_key
  before_action :take_card, only:[:show,:buy]

  def new
    @years=[]
    11.times do |index|
      this_year=Date.today.year%100
      @years.push(this_year+index)
    end
  end

  def create
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
        flash[:notice] = 'クレジットカードを登録しました'
        redirect_to "/"
      else
        flash[:alert] = 'クレジットカードを登録できませんでした'
        redirect_to action: "new"
      end
    end
  end

  def show 
    # if @card.blank?
    #   #登録された情報がない場合にカード登録画面に移動
    #   # flash[:alert] = '購入前にカード登録してください'
    #   redirect_to cards_path and return
    # else
      #保管した顧客IDでpayjpから情報取得
      set_customer
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      set_card_information
    # end
  end

  def buy
    @item = Item.find(params[:id])
    @buy_data = BuyData.new
    @card = Card.find_by(user_id: current_user.id)
    # Payjp.api_key = Rails.application.credentials[:payjp][:SECRET_KEY]
    charge = Payjp::Charge.create(
      amount: @item.price,
      customer: @card.customer_id,
      currency: 'jpy',
    )
    if @buy_data.update(user_id: current_user.id, item_id: @item.id)
      flash[:notice] = '購入できました！'
      redirect_to "/"
    else
      flash[:alert] = '購入できませんでした・・・'
      redirect_to action: "/"
    end
  end

  def destroy
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.credentials[:payjp][:SECRET_KEY]
    customer = Payjp::Customer.retrieve(card.customer_id)
    customer.delete
     #ここでpay.jpの方を消している
    card.delete
     #ここでテーブルにあるcardデータを消している
    flash[:notice] = 'カード情報を削除しました'
    redirect_to "/"
    # end  
  end

  private

  def set_api_key
    Payjp.api_key = Rails.application.credentials[:payjp][:SECRET_KEY]
  end

  def set_customer
    @customer = Payjp::Customer.retrieve(@card.customer_id)
  end

  def set_card_information
    @card_information = @customer.cards.retrieve(@card.paycard_id)
  end

  def take_card
    @card = Card.find_by(user_id: current_user.id)
  end
end

