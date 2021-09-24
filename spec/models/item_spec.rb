require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報の保存' do
    context '商品情報が保存できる時' do
      it '必須項目が全て適切な情報で入力されていると保存できる' do
        expect(@item).to be_valid
      end
      context '商品情報が保存できない時' do
        it '商品名が入力されていない' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it '商品画像が指定されていない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it '商品説明文が入力されていない' do
          @item.explanation = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Explanation can't be blank")
        end
        it 'カテゴリーで、---を選択すると保存できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end
        it '商品の状態で、---を選択すると保存できない' do
          @item.status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Status can't be blank")
        end
        it '配送料の負担で、---を選択すると保存できない' do
          @item.delivery_fee_id = 1 
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
        end
        it '発送元の地域で、---を選択すると保存できない' do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end
        it '発送までの日数で、---を選択すると保存できない' do
          @item.shopping_day_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shopping day can't be blank")
        end
        it '価格が入力されてない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number")
        end
        it '価格が300未満の値で入力されている' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
        end
        it '価格が10,000,000以上の値で入力されている' do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
        end 
        it '価格が全角で入力されている' do
          @item.price = '１００００００'
          @item.valid?
          binding.pry
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
      end
    end
  end
end
