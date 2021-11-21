require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能'do
    context '出品できる時'do
      it 'すべての必要項目が入力された時、出品できる' do
        expect(@item).to be_valid
      end
    end
    context '出品できない時' do
      it '商品画像が空だと出品できない'do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと出品できない'do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空だと出品できない'do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリーの情報が空だと出品できない'do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態の情報が空だと出品できない'do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料の負担の情報が空だと出品できない'do
        @item.delivery_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it '発送元の地域の情報が空だと出品できない'do
        @item.delivery_area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area can't be blank")
      end

      it '発送までの日数の情報が空だと出品できない'do
        @item.delivery_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end

      it '価格の情報が空だと出品できない'do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '売価格は、¥300~¥9,999,999の間のみ保存可能であること' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '売価格が¥9,999,999を超えると保存できない' do
        @item.price = '10,999,999'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      
      it '価格が全角数字だと出品できない'do
        @item.price = '２２２２'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'ユーザーが紐づいていなければ登録できない'do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end






