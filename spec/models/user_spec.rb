require 'rails_helper'

RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it 'nickname,email,password,password(確認用),first_name,last_name,first_name_kana,last_name_kana,birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない時' do 
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@がないと登録できない' do
        @user.email = 'jin090docomo.ne.jp'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it '既に登録されたメールアドレスは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '000jin000'
        @user.password_confirmation = '111jin000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが６文字以上でないと登録できない' do
        @user.password = '000ji'
        @user.password_confirmation = '000ji'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordは英数混合でないと登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers.")
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank","Last name is invalid. Input full-width characters.")
      end
      it 'last_nameが漢字、ひらがな、カタカナ以外では登録できない' do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank","First name is invalid. Input full-width characters.")
      end
      it 'first_nameが漢字、ひらがな、カタカナ以外では登録できない' do
        @user.first_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end
      it 'last_name_kanaが空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank","Last name kana is invalid. Input full-width katakana characters.")
      end
      it 'last_name_kanaがカタカナ以外だと登録できない' do
        @user.last_name_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters.")
      end
      it 'first_name_kanaが空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank","First name kana is invalid. Input full-width katakana characters.")
      end
      it 'first_name_kanaがカタカナ以外だと登録できない' do
        @user.first_name_kana = '太朗'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
      end
    end
  end
end







#ニックネームが必須であること。
#メールアドレスが必須であること。
#メールアドレスが一意性であること。
#メールアドレスは、@を含む必要があること。
#パスワードが必須であること。
#パスワードは、6文字以上での入力が必須であること
#パスワードは、半角英数字混合での入力が必須であること
#パスワードとパスワード（確認）は、値の一致が必須であること。

#お名前(全角)は、名字と名前がそれぞれ必須であること。
#お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること。
#お名前カナ(全角)は、名字と名前がそれぞれ必須であること。
#お名前カナ(全角)は、全角（カタカナ）での入力が必須であること。
#生年月日が必須であること。


#メールアドレスが必須であること。
#メールアドレスが一意性であること。
#メールアドレスは、@を含む必要があること。
#パスワードが必須であること。
#パスワードは、6文字以上での入力が必須であること。
#パスワードとパスワード（確認）は、値の一致が必須であること。