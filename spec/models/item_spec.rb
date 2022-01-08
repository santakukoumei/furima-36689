require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe "商品出品機能" do
    context '出品できるとき' do
      it "全ての項目が入力されていれば出品できる" do
        expect(@item).to be_valid
      end
    end
    context '出品できないとき' do
      it "imageが空だと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it "item_nameが空だと出品できない" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it "explanationが空では出品できない" do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end
      it "category_idが未選択（1）では出品できない" do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it "details_idが未選択（1）では出品できない" do
        @item.details_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Details can't be blank"
      end
      it "priceが空だと出品できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it "300円以下99999以上の金額では出品できない" do
        @item.price = '299' '100000'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 99999"
      end
      it "burdened_idが未選択（1）では出品できない" do
        @item.burdened_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Burdened can't be blank"
      end
      it "delivery_area_idが未選択（1）では出品できない" do
        @item.delivery_area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery area can't be blank"
      end
      it "delivery_day_idが未選択（1）では出品できない" do
        @item.delivery_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery day can't be blank"
      end
    end
  end
end
