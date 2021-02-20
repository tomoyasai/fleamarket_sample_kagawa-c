require 'rails_helper'

RSpec.describe Card, type: :model do
  describe '#create' do
    # 1. customer_idとpaycard_idが存在すれば登録できること
    it "is valid with customer_id, paycard_id" do
      card = build(:card)
      expect(card).to be_valid
    end

    # 2. customer_idが空では登録できないこと
    it "is invalid without customer_id" do
      card = build(:card, customer_id: nil)
      card.valid?
      expect(card.errors[:customer_id]).to include("can't be blank")
    end

    # 3. paycard_idが空では登録できないこと
    it "is invalid without a paycard_id" do
      card = build(:card, paycard_id: nil)
      card.valid?
      expect(card.errors[:paycard_id]).to include("can't be blank")
    end
  end
  # pending "add some examples to (or delete) #{__FILE__}"
end
