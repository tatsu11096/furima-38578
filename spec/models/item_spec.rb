require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品登録' do
    context '出品登録できるとき' do
      it 'image、name、message、condition_id、 category_id、  shipping_charge_id、 shipping_region_id、 shipping_date_id、 priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '出品登録できないとき' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end

      it 'messageが空だと登録できない' do
        @item.message = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Message can't be blank"
      end
      it 'conditionに「---」が選択されている場合は出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it 'categoryが「---」が選択されている場合は出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'shipping_chargeに「---」が選択されている場合は出品できない' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping charge can't be blank"
      end
      it 'shipping_regionに「---」が選択されている場合は出品できない' do
        @item.shipping_region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping region can't be blank"
      end
      it 'shipping_dateに「---」が選択されている場合は出品できない' do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping date can't be blank"
      end
      it '価格が空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is out of setting range'
      end
      it '価格が300円より安いと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is out of setting range'
      end
      it '価格が9999999円より高いと登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is out of setting range'
      end
      it '価格に半角数字以外が含まれている場合は出品できない' do
        @item.price = '1000a'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Half-width number'
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end
    end
  end
end
