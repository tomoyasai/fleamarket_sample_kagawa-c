class ItemsController < ApplicationController
  def index
  end

  def show
  end
  
  def new
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
end
