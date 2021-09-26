require 'rails_helper'

RSpec.describe Buyer, type: :model do
  before do
    @buyer = FactoryBot.build(:buyer_order)
  end

  describe '商品購入者情報の保存' do
    context '購入者情報が保存できる時' do
      it '必須項目が全て適切な情報で入力できている時' do
        expect(@buyer).to be_valid
      end
      it 'building_nameは空でも保存できる' do
        @buyer.building_name = ''
        expect(@buyer).to be_valid
      end
      it '電話番号が10桁でも保存できる' do
        @buyer.tell_number = '1212121212'
        expect(@buyer).to be_valid
      end
      it '電話番号が11桁でも保存できる' do
        @buyer.tell_number = '12121212121'
        expect(@buyer).to be_valid
      end
      context '購入者情報が保存できない時' do
        it '郵便番号が入力されていない' do
          @buyer.postal = ''
          @buyer.valid?
          expect(@buyer.errors.full_messages).to include("Postal can't be blank", "Postal is invalid. Enter it as follows (e.g. 123-4567)")
        end
        it '郵便番号に、-が入っていない' do
          @buyer.postal = '0000000'
          @buyer.valid?
          expect(@buyer.errors.full_messages).to include("Postal is invalid. Enter it as follows (e.g. 123-4567)")
        end
        it '都道府県で、---を選択すると保存できない' do
          @buyer.prefecture_id = 1
          @buyer.valid?
          expect(@buyer.errors.full_messages).to include("Prefecture can't be blank")
        end
        it '市区町村が入力されていない' do
          @buyer.city = ''
          @buyer.valid?
          expect(@buyer.errors.full_messages).to include("City can't be blank")
        end
        it '番地が入力されていない' do
          @buyer.address = ''
          @buyer.valid?
          expect(@buyer.errors.full_messages).to include("Address can't be blank")
        end
        it '電話番号が入力されていない' do 
          @buyer.tell_number = ''
          @buyer.valid?
          expect(@buyer.errors.full_messages).to include("Tell number can't be blank", "Tell number is invalid")
        end
        it '電話番号が10桁未満だと保存できない' do
          @buyer.tell_number = '090888888'
          @buyer.valid?
          expect(@buyer.errors.full_messages).to include("Tell number is invalid")
        end
        it '電話番号が12桁以上だと保存できない' do
          @buyer.tell_number = '121212121212'
          @buyer.valid?
          expect(@buyer.errors.full_messages).to include("Tell number is invalid")
        end
        it '電話番号が全角入力されていると保存できない' do
          @buyer.tell_number = '０９８３２１３４４４０'
          @buyer.valid?
          expect(@buyer.errors.full_messages).to include("Tell number is invalid")
        end
        it 'tokenが空だと入力できない' do
          @buyer.token = nil
          @buyer.valid?
          expect(@buyer.errors.full_messages).to include("Token can't be blank")
        end
        it 'user_idが空だと保存できない' do
          @buyer.user_id = nil
          @buyer.valid?
          expect(@buyer.errors.full_messages).to include("User can't be blank")
        end
        it 'item_idが空だと保存できない' do
          @buyer.item_id = nil
          @buyer.valid?
          expect(@buyer.errors.full_messages).to include("Item can't be blank")
        end
      end
    end
  end
end
