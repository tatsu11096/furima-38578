require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @item_order = FactoryBot.build(:item_order, user_id: @user, item_id: @item)
  end

  describe '配送情報入力' do
    context '配送先情報が登録ができるとき'
    it '全ての入力事項が、存在すれば登録できる' do
      expect(@item_order).to be_valid
    end

    it 'user_idが空でなければ保存できる' do
      @item_order.user_id = 2
      expect(@item_order).to be_valid
    end
    it 'item_idが空でなければ保存できる' do
      @item_order.item_id = 2
      expect(@item_order).to be_valid
    end

    it '建物名が空白でも保存できる' do
      @item_order.building = ''
      expect(@item_order).to be_valid
    end
  end

  context '購入できないとき' do
    it '郵便番号が空だと購入できない' do
      @item_order.zip_code = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include "Zip code can't be blank"
    end
    it '郵便番号は3桁ハイフン4桁の半角文字列でないと購入できない' do
      @item_order.zip_code = '1234567'
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include 'Zip code is invalid. Include hyphen(-)'
    end
    it '発送先の地域に「---」が選択されている場合は購入できない' do
      @item_order.shipping_region_id = 0
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include "Shipping region can't be blank"
    end
    it '市区町村が空だと購入できない' do
      @item_order.city = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include "City can't be blank"
    end

    it '番地が空だと購入できない' do
      @item_order.city_address = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include "City address can't be blank"
    end
    it '電話番号が空だと購入できない' do
      @item_order.telephone = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include "Telephone can't be blank"
    end
    it '電話番号が10桁未満だと購入できない' do
      @item_order.telephone = '123456789'
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include 'Telephone is invalid'
    end
    it '電話番号が11桁より多いと購入できない' do
      @item_order.telephone = '1234567890123'
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include 'Telephone is invalid'
    end

    it '電話番号に半角数値以外が含まれている場合は購入できない' do
      @item_order.telephone = '123-4567-8901'
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include 'Telephone is invalid'
    end

    it 'ユーザーが紐付いていなければ投稿できない' do
      @item_order.user_id = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include "User can't be blank"
    end
    it '商品が紐付いていなければ投稿できない' do
      @item_order.item_id = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include "Item can't be blank"
    end

    it 'tokenが空では登録できない' do
      @item_order.token = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include "Token can't be blank"
    end
  end
end
