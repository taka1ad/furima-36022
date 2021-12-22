require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  before do
    buyer = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buyer_address = FactoryBot.build(:buyer_address, user_id: buyer.id, item_id: item.id)
    
    sleep 0.5
  end
  describe '商品購入機能'do
    context '購入できる時'do
      it 'すべての必要項目が入力された時、購入できる' do
        expect(@buyer_address).to be_valid
      end
    end
    context '購入できない時'do
      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能であること'do
        @buyer_address.postal_code = '１２３４５６７'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Postal code input correctly")
      end
      it '都道府県が空だと購入できない'do
        @buyer_address.delivery_area_id = 1
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Delivery area can't be blank")
      end                                                    
      it '市区町村が空だと購入できない'do
        @buyer_address.manicipality = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Manicipality can't be blank")
      end
      it '番地が空だと購入できない'do
        @buyer_address.house_number = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能であること'do
        @buyer_address.postal_code = '０９０-１２３４-５６７８'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Postal code input correctly")
      end
      it "tokenが空では登録できないこと" do
        @buyer_address.token = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end

