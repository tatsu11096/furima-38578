require 'rails_helper'

RSpec.describe Delivery, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user_id: @user.id)
    @delivery = FactoryBot.build(:delivery, user_id: @user.id, item_id: @item.id)
  end

  describe '配送情報入力' do
    context '配送先情報が登録ができるとき'
    it '全ての入力事項が、存在すれば登録できる' do
      expect(@delivery).to be_valid
    end

    it '建物名が空白でも保存できる' do
      @delivery.building = ''
      expect(@delivery).to.be_valid
    end
  end

  context '購入できないとき' do
    it '郵便番号が空だと購入できない' do
      @delivery.zip_code = nil
      @delivery.valid?
      expect(@delivery.errors.full_messages).to include "Zip code can't be blank"
    end
    it '郵便番号は3桁ハイフン4桁の半角文字列じゃないと購入できない' do
      @delivery.zip_code = '1234567'
      @delivery.valid?
      expect(@delivery.errors.full_messages).to include 'Zip code is in invalid. Include hyphen(-)'
    end
    it '発送先の地域に「---」が選択されている場合は購入できない' do
      @delivery.shipping_region_id = 0
      @delivery.valid?
      expect(@delivery.errors.full_messages).to include "Prefecture can't be blank"
    end
    it '市区町村が空だと購入できない' do
      @delivery.city = nil
      @delivery.valid?
      expect(@delivery.errors.full_messages).to include "City can't be blank"
    end

    it '番地が空だと購入できない' do
      @delivery.city_address = nil
      @delivery.valid?
      expect(@delivery.errors.full_messages).to include "City address can't be blank"
    end
    it '電話番号が空だと購入できない' do
      @delivery.telephone = nill
      delivery.valid?
      expect(@delivery.errors.full_messages).to include "Telephone can't be blank"
    end
    it '電話番号が10桁未満だと購入できない' do
      @delivery.telephone = '123456789'
      @delivery.valid?
      expect(@delivery.errors.full_messages).to include 'Telephone is invalid.'
    end
    it '電話番号が11桁より多いだと購入できない' do
      @delivery.telephone = '1234567890123'
      @delivery.valid?
      expect(@delivery.errors.full_messages).to include 'telephone is invalid.'
    end

    it '電話番号に半角数値以外が含まれている場合は購入できない' do
      @delivery.telephone = '123-4567-8901'
      @delivery.valid?
      expect(@delivery.errors.full_messages).to include 'telephone is invalid.'
    end

    it 'ユーザーが紐付いていなければ投稿できない' do
      @delivery.item_id = nil
      @delivery.valid?
      expect(@delivery.errors.full_messages).to include "User can't be blank"
    end
    it '商品が紐付いていなければ投稿できない' do
      @delivery.item_id = nill
      @delivery.valid?
      expect(@delivery.errors.full_messages).to include "Item can't be blank"
    end
  end
end
