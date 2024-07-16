require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it "内容に問題ない場合" do
        expect(@order_address).to be_valid
      end
      it "buildingが空でも購入できる" do
        @order_address.building = ""
        expect(@order_address).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it "postcodeが空では購入できない" do
        @order_address.postcode = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postcode can't be blank")
      end
      it "postcodeに-が含まれていないと購入できない" do
        @order_address.postcode = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
      end
      it "postcodeに「3桁ハイフン4桁」でないと購入できない" do
        @order_address.postcode = '1234-567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
      end
      it "postcodeは半角文字列でないと購入できない" do
        @order_address.postcode = '１２３ー４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
      end
      it "prefecture_idが1では購入できない" do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "cityが空では購入できない" do
        @order_address.city = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it "blockが空では購入できない" do
        @order_address.block = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Block can't be blank")
      end
      it "phone_numberが空では購入できない" do
        @order_address.phone_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberが短いと購入できない" do
        @order_address.phone_number = "123456789"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
      end
      it "phone_numberが全角数字では購入できない" do
        @order_address.phone_number = "１２３４５６７８９１０"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it "tokenが空では購入できない" do
        @order_address.token = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it "userが紐づいていなければ出品できない" do
        @order_address.user_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it "itemが紐づいていなければ出品できない" do
        @order_address.item_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
