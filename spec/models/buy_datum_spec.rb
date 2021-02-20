require 'rails_helper'

RSpec.describe BuyData, type: :model do
  describe '#create' do
    # 1. user_idとitem_idが存在すると登録できること
    it "is valid with user_id, item_id" do
      buy_data = build(:buy_data)
      expect(buy_data).to be_valid
    end

    # 2. user_idが空では登録できないこと
    it "is invalid without a user_id" do
      buy_data = build(:buy_data, user_id: nil)
      buy_data.valid?
      expect(buy_data.errors[:user_id]).to include("can't be blank")
    end

    # 3. item_idが空では登録できないこと
    it "is invalid without a item_id" do
      buy_data = build(:buy_data, item_id: nil)
      buy_data.valid?
      expect(buy_data.errors[:item_id]).to include("can't be blank")
    end
  end
  # pending "add some examples to (or delete) #{__FILE__}"
end
