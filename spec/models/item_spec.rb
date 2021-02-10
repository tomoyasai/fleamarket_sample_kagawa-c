require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    it "商品出品ができる時" do
      @item = build(:item)
      expect(@item).to be_valid
    end

    it "is invalid without a name" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a info" do
      item = build(:item, info: "")
      item.valid?
      expect(item.errors[:info]).to include("can't be blank")
    end

    it "is invalid without a image" do
      item = build(:item, image: "")
      item.valid?
      expect(item.errors[:image]).to include("can't be blank")
    end

    it "is invalid without a status_id" do
      item = build(:item, status_id: "")
      item.valid?
      expect(item.errors[:status_id]).to include("can't be blank")
    end

    it "is invalid without a delivery_fee_id " do
      item = build(:item, delivery_fee_id: "")
      item.valid?
      expect(item.errors[:delivery_fee_id]).to include("can't be blank")
    end

    it "is invalid without a delivery_days_id" do
      item = build(:item, delivery_days_id: "")
      item.valid?
      expect(item.errors[:delivery_days_id]).to include("can't be blank")
    end


    it "is invalid without a prefecture_id " do
      item = build(:item, prefecture_id: "")
      item.valid?
      expect(item.errors[:prefecture_id]).to include("can't be blank")
    end

    it "is invalid without a price" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

  end
  
  describe '#edit' do
    it "商品編集ができる時" do
      @item = build(:item)
      expect(@item).to be_valid
    end

    it "is invalid without a name" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a info" do
      item = build(:item, info: "")
      item.valid?
      expect(item.errors[:info]).to include("can't be blank")
    end

    it "is invalid without a image" do
      item = build(:item, image: "")
      item.valid?
      expect(item.errors[:image]).to include("can't be blank")
    end

    it "is invalid without a status_id" do
      item = build(:item, status_id: "")
      item.valid?
      expect(item.errors[:status_id]).to include("can't be blank")
    end

    it "is invalid without a delivery_fee_id " do
      item = build(:item, delivery_fee_id: "")
      item.valid?
      expect(item.errors[:delivery_fee_id]).to include("can't be blank")
    end

    it "is invalid without a delivery_days_id" do
      item = build(:item, delivery_days_id: "")
      item.valid?
      expect(item.errors[:delivery_days_id]).to include("can't be blank")
    end


    it "is invalid without a prefecture_id " do
      item = build(:item, prefecture_id: "")
      item.valid?
      expect(item.errors[:prefecture_id]).to include("can't be blank")
    end

    it "is invalid without a price" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end
  end
end