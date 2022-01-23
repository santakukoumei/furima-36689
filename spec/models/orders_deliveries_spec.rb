require 'rails_helper'

RSpec.describe OrdersDeliveries, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @orders_deliveries = FactoryBot.build(:orders_deliveries, user_id: user.id, item_id: item.id)
    end

    context '入力内容に問題がない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
      end
      it 'buildingは空でも保存できること' do
      end
    end

    context '入力内容に問題がある場合' do
      it "tokenが空では登録できないこと" do
        @orders_deliveries.token = nil
        @orders_deliveries.valid?
        expect(@orders_deliveries.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できないこと' do
        @orders_deliveries.postal_code = ''
        @orders_deliveries.valid?
        expect(@orders_deliveries.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @orders_deliveries.postal_code = '1234567'
        @orders_deliveries.valid?
        expect(@orders_deliveries.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it "delivery_area_idが未選択（1）では出品できない" do
        @orders_deliveries.delivery_area_id = '1'
        @orders_deliveries.valid?
        expect(@orders_deliveries.errors.full_messages).to include "Delivery area can't be blank"
      end
      it 'cityが空だと保存できないこと' do
        @orders_deliveries.city = ''
        @orders_deliveries.valid?
        expect(@orders_deliveries.errors.full_messages).to include("City can't be blank")
      end
      it 'streetが空だと保存できないこと' do
        @orders_deliveries.street = ''
        @orders_deliveries.valid?
        expect(@orders_deliveries.errors.full_messages).to include("Street can't be blank")
      end
      it 'telephone_numberが空だと保存できないこと' do
        @orders_deliveries.telephone_number = ''
        @orders_deliveries.valid?
        expect(@orders_deliveries.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが10桁以上の半角数値でないと保存できないこと' do
        @orders_deliveries.telephone_number = '123456789'
        @orders_deliveries.valid?
        expect(@orders_deliveries.errors.full_messages).to include("Telephone number is invalid.")
      end
      it 'telephone_numberが11桁以内の半角数値でないと保存できないこと' do
        @orders_deliveries.telephone_number = '012345678901'
        @orders_deliveries.valid?
        expect(@orders_deliveries.errors.full_messages).to include("Telephone number is invalid.")
      end
      it 'telephone_numberが10桁以上の全角数値でないと保存できないこと' do
        @orders_deliveries.telephone_number = '１２３４５６７８９'
        @orders_deliveries.valid?
        expect(@orders_deliveries.errors.full_messages).to include("Telephone number is invalid.")
      end
      it 'telephone_numberが11桁以内の全角数値でないと保存できないこと' do
        @orders_deliveries.telephone_number = '０１２３４５６７８９０１'
        @orders_deliveries.valid?
        expect(@orders_deliveries.errors.full_messages).to include("Telephone number is invalid.")
      end
      it 'userが紐付いていないと保存できないこと' do
        @orders_deliveries.user_id = nil
        @orders_deliveries.valid?
        expect(@orders_deliveries.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @orders_deliveries.item_id = nil
        @orders_deliveries.valid?
        expect(@orders_deliveries.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end