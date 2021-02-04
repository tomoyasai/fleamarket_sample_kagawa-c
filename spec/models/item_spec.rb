require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    # before do
    #   user = FactoryBot.create(:user)
    #   item = FactoryBot.build(:item, user_id: user.id)
    # end
    it "商品出品ができる時" do
      @item = build(:item)
      expect(@item).to be_valid
    end

    # it "is invalid without a info" do
    #   @item = FactoryBot.create(:item, info: "")
    #   @item.valid?
    #   expect(@item.errors.full_messages).to include("can't be blank")
    # end
  end
end
# describe Product do
#   describe '#create' do
#     it "is valid with a name, price, description, status, size, days, cost, prefecture_id, category_id, user_id" do
#       product = FactoryBot.build(:product)
#       expect(product).to be_valid
#     end
#   end
# end
